//
//  ReminderForm.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct ReminderForm: View {
    @State var viewModel: ReminderFormViewModel = ReminderFormViewModel()
    @Environment(GeneralCoordinator.self) var coordinator

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("new_list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            TextArea()
            
            Text("list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            Button {
                coordinator.present(sheet: .selectListSheet)
            } label: {
                ListSelectionRow(selectedList: $viewModel.selectedList)
            }

            Text("details")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            DetailsSection(selectedDate: $viewModel.selectedDate, selectedTime: $viewModel.selectedTime)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ReminderForm().environment(coordinator)
}
