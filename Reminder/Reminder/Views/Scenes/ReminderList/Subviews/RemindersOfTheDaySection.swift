//
//  RemindersOfTheDaySection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 30/04/25.
//

import SwiftUI

struct RemindersOfTheDaySection: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    func formatHourAndDay(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "E, HH:mm"
        return formatter.string(from: date)
    }
    
    func getColorFromList(reminder: Reminder) -> Color {
        guard let id = reminder.listReference?.uuidString else {
            return .cinzaLabels
        }
        let reminderList = reminderListViewModel.getReminderListById(id)
 
        return (reminderList?.color.extractColorFromNamedColor() ?? reminderList?.color.extractRGBColor()) ?? Color(.cinzaLabels)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("for_today")
                .foregroundStyle(.branco)
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            if reminderListViewModel.reminders.filter({ reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}).isEmpty {
                Text("all_reminders_empty")
                    .setBdoGroteskFont(weight: .medium, size: 16)
            } else {
                ForEach(reminderListViewModel.reminders.filter { reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished }, id: \.id) { reminder in
                    ReminderCard(
                        title: reminder.title,
                        time: formatHourAndDay(reminder.alertTime),
                        textTag: reminder.description,
                        colorTag: getColorFromList(reminder: reminder),
                        action: {
                            reminderListViewModel.finishReminder(reminder.id)
                    })
                    .contextMenu {
                        Button {
                            // TODO: coordinator.goToEditReminderScreen(reminder.id)
                            print(reminder.alertTime)
                        } label: {
                            HStack {
                                Text("edit")
                                IconsManager.setIcon(icon: .gear)
                            }
                        }
                        
                        Button {
                            reminderListViewModel.deleteReminder(reminder)
                            reminderListViewModel.reminders = reminderListViewModel.getAllReminders()
                            reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
                        } label: {
                            HStack {
                                Text("delete")
                                IconsManager.setIcon(icon: .trash)
                            }
                        }
                    }
                        .padding(.bottom, 24)
                }
            }
        }
    }
}

#Preview {
    RemindersOfTheDaySection()
}
