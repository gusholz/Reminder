//
//  DetailsSection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 07/04/25.
//

import SwiftUI

struct DetailsSection: View {
    @Environment(GeneralCoordinator.self) var coordinator
    
    @Binding var selectedDate: Date
    @Binding var selectedTime: Date
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
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("date")
                        .setBdoGroteskFont(weight: .regular, size: 16)
                        .foregroundStyle(.branco)
                    Text(formatDate(selectedDate))
                        .setBdoGroteskFont(weight: .regular, size: 10)
                        .foregroundStyle(.cinzaLabels)
                    
                }
                
                Toggle(isOn: $isDataToggleOn) {
                    
                }
            }
            
            if isDataToggleOn {
                DatePicker("reminder_date", selection: $selectedTime, displayedComponents: .date)
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
                    Text(formatTIme(selectedTime))
                        .setBdoGroteskFont(weight: .regular, size: 10)
                        .foregroundStyle(.cinzaLabels)
                    
                }
                
                Toggle(isOn: $isTimeToggleOn) {
                    
                }
            }
            
            if isTimeToggleOn {
                DatePicker("", selection: $selectedTime, displayedComponents: [.hourAndMinute])
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
        .background(.cinzaBackground)
        .cornerRadius(10)
    }
}

#Preview {
    @Previewable @State var selectedDate = Date.now
    @Previewable @State var selectedTime = Date.now
    
    DetailsSection(selectedDate: $selectedDate, selectedTime: $selectedTime)
}
