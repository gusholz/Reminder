//
//  ReminderForm.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct ReminderForm: View {
    @State private var isDataToggleOn: Bool = false
    @State private var isTimeToggleOn: Bool = false
    @State private var selectedDate: Date = Date.now
    @State private var selectedTime: Date = Date.now
    
    @State private var isRepetitionSheetOpen = false
    @State var selectedDays: [Bool] = [false, false, false, false, false, false, false]

        
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
        VStack(alignment: .leading) {
            Text("ReminderForm")
                .foregroundStyle(ColorManager.setColor(.cinzaLabels))
                .padding(.leading, 14)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Data")
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
                    DatePicker("Prazo do Lembrete", selection: $selectedDate)
                        .datePickerStyle(.graphical)
                        .tint(.verde)
                        .frame(minHeight: 360)
                }
                
                
                Divider()

                HStack {
                    VStack(alignment: .leading) {
                        Text("Horário")
                            .setBdoGroteskFont(weight: .regular, size: 16)
                            .foregroundStyle(.branco)
                        // TODO: Senão colocar um horário colocar um horário default de 00:00 hrs
                        Text(formatTIme(selectedTime))
                            .setBdoGroteskFont(weight: .regular, size: 10)
                            .foregroundStyle(.cinzaLabels)
                        
                    }
                    
                    Toggle(isOn: $isTimeToggleOn) {
                        
                    }
                }
                
                if isTimeToggleOn {
                    DatePicker("", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .tint(.verde)
                }
                
                Divider()
                
                HStack {
                    Text("Repetir")
                        .setBdoGroteskFont(weight: .regular, size: 16)
                        .foregroundStyle(.branco)

                    Spacer()
                                        
                    Button {
                        isRepetitionSheetOpen.toggle()
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
        .sheet(isPresented: $isRepetitionSheetOpen) {
            DaySelection(selectedDays: $selectedDays)
        }
        
    }
}

#Preview {
    ReminderForm()
}
