//
//  ReminderForm.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct ReminderForm: View {
    @State var viewModel: ReminderFormViewModel = ReminderFormViewModel()
 
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextArea()
            
            Text("details")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            DetailsSection(selectedDate: $viewModel.selectedDate, selectedTime: $viewModel.selectedTime)
        }
        .padding()
    }
}

#Preview {
    ReminderForm()
}
