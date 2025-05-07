//
//  CreateReminderScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct CreateReminderScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    @State var reminderTitle: String = ""
    @State var reminderDescription: String = ""
    @State var selectedList: String = ""
    @State var selectedDate: Date = Date.now
    @State var selectedDays: [Bool] = [false, false, false, false, false, false, false]

    var body: some View {
        VStack {
            GenericNavBar(title: "new_reminder", actionTitle: "save", isSaveActionDisabled: reminderTitle.isEmpty) {
                if reminderTitle.isEmpty{
                    return
                }
                var newReminder: Reminder
                if reminderListViewModel.selectedReminderList == nil {
                    newReminder = Reminder(id: .init(), title: reminderTitle, description: reminderDescription, alertTime: selectedDate, isFinished: false)
                } else {
                    newReminder = Reminder(id: .init(), title: reminderTitle, description: reminderDescription, alertTime: selectedDate, listReference: reminderListViewModel.selectedReminderList?.id, isFinished: false)
                }
                
                reminderListViewModel.createReminder(newReminder)
                reminderListViewModel.editReminder(newReminder)
                coordinator.pop()
            } dismissAction: {
                coordinator.pop()
            } 
                .padding()
            ScrollView(.vertical){
                ReminderForm(reminderTitle: $reminderTitle, reminderDescription: $reminderDescription, selectedList: $selectedList, selectedDate: $selectedDate, selectedDays: $selectedDays)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    CreateReminderScreen().environment(coordinator)
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    @Previewable var reminderListViewModel = ReminderListViewModel()
    NavigationStack {
        CreateReminderScreen().environment(coordinator).environment(reminderListViewModel)
    }
}
