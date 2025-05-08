//
//  ListDetailsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 22/04/25.
//

import SwiftUI

struct ListDetailsScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(reminderListViewModel.selectedReminderList?.title ?? "Unknown List")
                .setBdoGroteskFont(weight: .medium, size: 30)
                .padding(.bottom, 12)
            Text(reminderListViewModel.selectedReminderList?.description ?? "")
                .setBdoGroteskFont(weight: .regular, size: 14)
            
            Divider()
                .overlay(.branco)
                .padding(.bottom, 8)
            
            ScrollView {
                ForEach(reminderListViewModel.reminders, id: \.id) { reminder in
                    if let selectedList = reminderListViewModel.selectedReminderList {
                        if reminder.listReference == selectedList.id && reminder.isFinished == false {
                            ReminderCard(
                                title: reminder.title,
                                time: reminder.alertTime.formattedHourAndDay,
                                textTag: reminder.description,
                                colorTag: reminderListViewModel.getColorFromList(reminder: reminder),
                                action: {
                                    reminderListViewModel.finishReminder(reminder.id)
                                })
                            .padding(.bottom, 24)
                        }
                    }
                }
            }
            
            Spacer()
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                IconsManager.setIcon(icon: .arrowLeft)
                    .frame(width: 54, alignment: .leading)
                    .onTapGesture {
                        coordinator.pop()
                    }
            }
            
            ToolbarItem {
                HStack {
                    IconsManager.setIcon(icon: .circleWithThreeDots)
                        .frame(width: 54, alignment: .leading)
                        .contextMenu {
                            Button {
                                coordinator.navigate(to: .editListView)
                            } label: {
                                HStack {
                                    Text("edit")
                                    IconsManager.setIcon(icon: .gear)
                                }
                            }
                            
                            Button {
                                if let selectedReminder = reminderListViewModel.selectedReminderList {
                                    reminderListViewModel.deleteReminderList(selectedReminder.id.uuidString)
                                    coordinator.pop()
                                }
                            } label: {
                                HStack {
                                    Text("delete")
                                    IconsManager.setIcon(icon: .trash)
                                }
                            }
                        }
                    IconsManager.setIcon(icon: .plusCircleFilled)
                        .frame(width: 54, alignment: .leading)
                        .onTapGesture {
                            coordinator.navigate(to: .createReminderSheet)
                        }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(reminderListViewModel.getColorFromSelectedList(), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
