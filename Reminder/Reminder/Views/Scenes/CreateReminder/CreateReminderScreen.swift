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
    @State var selectedHour: Date = Date.now
    @State var selectedDays: [Int] = []

    var body: some View {
        VStack {
            GenericNavBar(title: "new_reminder", actionTitle: "save") {
                if reminderTitle.isEmpty{
                    return
                }
                var newReminder: Reminder
                if selectedList.isEmpty {
                    newReminder = Reminder(id: .init(), title: reminderTitle, description: reminderDescription, alertTime: selectedDate)
                } else {
                    newReminder = Reminder(id: .init(), title: reminderTitle, description: reminderDescription, alertTime: selectedDate, listReference: UUID(uuidString: selectedList))
                }
                
                reminderListViewModel.createReminder(newReminder)
                
            } dismissAction: {
                coordinator.pop()
            }
                .padding()
            ScrollView(.vertical){
                ReminderForm(reminderTitle: $reminderTitle, reminderDescription: $reminderDescription, selectedList: $selectedList, selectedDate: $selectedDate, selectedHour: $selectedHour, selectedDays: $selectedDays)
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
