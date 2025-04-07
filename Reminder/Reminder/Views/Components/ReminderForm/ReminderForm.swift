//
//  ReminderForm.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct ReminderForm: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @State var viewModel: ReminderFormViewModel = ReminderFormViewModel()
    
    @State private var isDataToggleOn: Bool = false
    @State private var isTimeToggleOn: Bool = false
        
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func formatTIme(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
 
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextArea()
            
            Text("details")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(ColorManager.setColor(.cinzaLabels))
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("date")
                            .setBdoGroteskFont(weight: .regular, size: 16)
                            .foregroundStyle(.branco)
                        Text(formatDate(viewModel.selectedDate))
                            .setBdoGroteskFont(weight: .regular, size: 10)
                            .foregroundStyle(.cinzaLabels)
                        
                    }
                    
                    Toggle(isOn: $isDataToggleOn) {
                        
                    }
                }
                
                if isDataToggleOn {
                    DatePicker("reminder_date", selection: $viewModel.selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .tint(.verde)
                        .frame(minHeight: 360)
                }
                
                
                Divider()

                HStack {
                    VStack(alignment: .leading) {
                        Text("hour")
                            .setBdoGroteskFont(weight: .regular, size: 16)
                            .foregroundStyle(.branco)
                        // TODO: Se não colocar um horário colocar um horário default de 00:00 hrs
                        Text(formatTIme(viewModel.selectedTime))
                            .setBdoGroteskFont(weight: .regular, size: 10)
                            .foregroundStyle(.cinzaLabels)
                        
                    }
                    
                    Toggle(isOn: $isTimeToggleOn) {
                        
                    }
                }
                
                if isTimeToggleOn {
                    DatePicker("", selection: $viewModel.selectedTime, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .tint(.verde)
                }
                
                Divider()
                
                HStack {
                    Text("repetition")
                        .setBdoGroteskFont(weight: .regular, size: 16)
                        .foregroundStyle(.branco)

                    Spacer()
                                        
                    Button {
                        coordinator.present(sheet: .selectedDaysSheet)
                    } label: {
                        Text("Nunca")
                            .foregroundStyle(.cinzaLabels)
                    }
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(ColorManager.setColor(.cinzaBackground))
            .cornerRadius(10)
                
        }
        .padding()
    }
}

#Preview {
    ReminderForm()
}
