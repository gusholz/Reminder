//
//  ReminderForm.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct ReminderForm: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    @Binding var reminderTitle: String
    @Binding var reminderDescription: String
    @Binding var selectedList: String
    @Binding var selectedDate: Date
    @Binding var selectedDays: [Bool]

    @State private var isSelectListSheetOpen: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("new_reminder")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            TextArea(title: $reminderTitle, description: $reminderDescription)
            
            Text("list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            Button {
                isSelectListSheetOpen.toggle()
            } label: {
                ListSelectionRow(selectedList: reminderListViewModel.selectedReminderList)
            }

            Text("details")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0 ))
                .foregroundStyle(.cinzaLabels)
            
            DetailsSection(selectedDate: $selectedDate, selectedDays: $selectedDays)
            
            Spacer()
        }
        .sheet(isPresented: $isSelectListSheetOpen) {
            SelectListScreen(isSheetOpen: $isSelectListSheetOpen)
        }
        .padding()
    }
}
