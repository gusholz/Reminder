//
//  ListsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct ListsScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical) {
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
                                title: list.title)
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            
                Button {
                    coordinator.navigate(to: .createListSheet)
                } label: {
                    Text("create_new_list")
                }
            
        }
        .task {
            reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("my_lists")
                    .setBdoGroteskFont(weight: .medium, size: 20)
            }
            
            ToolbarItem {
                IconsManager.setIcon(icon: .plusCircleFilled)
                    .font(.system(size: 26))
                    .foregroundStyle(.verde)
                    .onTapGesture {
                        coordinator.navigate(to: .createReminderSheet)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ListsScreen().environment(coordinator)
    }
    
}
