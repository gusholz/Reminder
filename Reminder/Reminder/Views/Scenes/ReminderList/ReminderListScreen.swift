//
//  ReminderListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 09/04/25.
//

import SwiftUI

struct ReminderListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    let rows = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    func formatHourAndDay(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "E, HH:mm" // E = abbreviated weekday, HH:mm = 24-hour time
        return formatter.string(from: date)
    }

    var body: some View {
        ScrollView(.vertical) {
            // Lists list section
            
            VStack(alignment: .leading) {
                Text("my_lists")
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        if reminderListViewModel.remindersLists.isEmpty {
                            Text("Nenhuma lista criada até o momento 🤝")
                        } else {
                            ForEach(reminderListViewModel.remindersLists, id: \.self) { list in
                                Button {
                                    reminderListViewModel.selectedReminderList = list
                                    coordinator.navigate(to: .listDetailView)
                                } label: {
                                    ListCard(
                                        color: (list.color.extractColorFromNamedColor() ?? list.color.extractRGBColor()) ?? Color(.branco),
                                        icon: IconsManager.getIcon(iconString: list.icon),
                                        title: list.title
                                    )
                                }
                            }
                        }
                    }
                }
                .frame(height: 180)
            }
            
            Divider()
                .overlay(.cinzaLabels)
            
            // Today Reminder Section
            VStack(alignment: .leading) {
                Text("for_today")
                    .foregroundStyle(.branco)
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                if reminderListViewModel.reminders.filter({ reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}).isEmpty {
                    Text("Todos os lembretes foram finalizados 😎! Para criar um novo basta clickar no ícone no canto superior direito da tela")
                        .setBdoGroteskFont(weight: .medium, size: 16)
                } else {
                    ForEach(reminderListViewModel.reminders.filter { reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished }, id: \.id) { reminder in
                        
                        // TODO: Criar função auxiliar que modifica a colorTag com base na cor da reminderList pai do reminder em questão
                        ReminderCard(
                            title: reminder.title,
                            time: formatHourAndDay(reminder.alertTime),
                            textTag: reminder.description,
                            colorTag: .amarelo,
                            action: {
                                reminderListViewModel.finishReminder(reminder.id)
                        })
                        .contextMenu {
                            Button {
                                // TODO: coordinator.goToEditReminderScreen(reminder.id)
                                print(reminder.alertTime)
                            } label: {
                                HStack {
                                    Text("Editar")
                                    IconsManager.setIcon(icon: .gear)
                                }
                            }
                            
                            Button {
                                reminderListViewModel.deleteReminder(reminder)
                                reminderListViewModel.reminders = reminderListViewModel.getAllReminders()
                                reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
                            } label: {
                                HStack {
                                    Text("Apagar")
                                    IconsManager.setIcon(icon: .trash)
                                }
                            }
                        }
                            .padding(.bottom, 24)
                    }
                }
            }
            
            Divider()
                .overlay(.cinzaLabels)
            
            // Next Days Reminder Section
            VStack(alignment: .leading) {
                Text("next_days")
                    .foregroundStyle(.branco)
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                if reminderListViewModel.reminders.filter({!reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}).isEmpty {
                    Text("Todos os lembretes foram finalizados 😎! Para criar um novo basta clickar no ícone no canto superior direito da tela")
                        .setBdoGroteskFont(weight: .medium, size: 16)
                } else {
                    ForEach(reminderListViewModel.reminders.filter { !reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}, id: \.id) { reminder in
                        ReminderCard(
                            title: reminder.title,
                            time: formatHourAndDay(reminder.alertTime),
                            textTag: reminder.description,
                            action: {
                                reminderListViewModel.finishReminder(reminder.id)
                        })
                        .padding(.bottom, 24)
                    }
                }
            }
        }
        .task {
            reminderListViewModel.reminders = reminderListViewModel.getAllReminders()
            reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image("logo")
            }
            
            ToolbarItemGroup {
                HStack {
                    Button {
                        coordinator.navigate(to: .configurations)
                    } label: {
                        IconsManager.setIcon(icon: .gear)
                            .foregroundStyle(.branco)
                            .font(.system(size: 26))
                    }
                    
                    Spacer()
                    
                    Button {
                        coordinator.navigate(to: .createReminderSheet)
                    } label: {
                        IconsManager.setIcon(icon: .plusCircleFilled)
                            .font(.system(size: 26))
                            .foregroundStyle(.verde)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var viewModel = ReminderListViewModel()
    @Previewable var coordinator = GeneralCoordinator()
    ReminderListScreen().environment(coordinator).environment(viewModel)
}

#Preview {
    @Previewable var viewModel = ReminderListViewModel()
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ReminderListScreen().environment(coordinator).environment(viewModel)
    }
}
