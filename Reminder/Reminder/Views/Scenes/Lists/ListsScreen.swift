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
                    Text("no_lists")
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
                            .contextMenu {
                                Button {
                                    reminderListViewModel.selectedReminderList = list
                                    coordinator.navigate(to: .editListView)
                                } label: {
                                    HStack {
                                        Text("edit")
                                        IconsManager.setIcon(icon: .gear)
                                    }
                                }
                                
                                Button {
                                    reminderListViewModel.deleteReminderList(list.id.uuidString)
                                } label: {
                                    HStack {
                                        Text("delete")
                                        IconsManager.setIcon(icon: .trash)
                                    }
                                }
                            }
                            .padding(.bottom, 8)
                        }
                    }
                }
            }
            
            DefaultButton(label: "create_new_list") {
                coordinator.navigate(to: .createListSheet)
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
    @Previewable var viewModel = ReminderListViewModel()
    NavigationStack {
        ListsScreen().environment(coordinator).environment(viewModel)
    }
    
}
