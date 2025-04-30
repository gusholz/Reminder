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
    @Binding var selectedDays: [Bool]
    @State private var isDataToggleOn: Bool = false;
    @State private var isSheetOpen: Bool = false;
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("date")
                        .setBdoGroteskFont(weight: .regular, size: 16)
                        .foregroundStyle(.branco)
                    Text(selectedDate.formatted(date: .abbreviated, time: .standard))
                        .setBdoGroteskFont(weight: .regular, size: 10)
                        .foregroundStyle(.cinzaLabels)
                    
                }
                
                Toggle(isOn: $isDataToggleOn) {
                    
                }
            }
            
            if isDataToggleOn {
                DatePicker("reminder_date", selection: $selectedDate, in: Date()...)
                    .datePickerStyle(.graphical)
                    .tint(.verde)
                    .frame(minHeight: 360)
            }
            
            Divider()
                        
            HStack {
                Text("repetition")
                    .setBdoGroteskFont(weight: .regular, size: 16)
                    .foregroundStyle(.branco)
                
                Spacer()
                
                Button {
                    isSheetOpen.toggle()
                } label: {
                    HStack {
                        Text("Nunca")
                            .setBdoGroteskFont(weight: .regular, size: 14)
                            .foregroundStyle(.cinzaLabels)
                        IconsManager.setIcon(icon: .arrowRight)
                            .foregroundStyle(.cinzaLabels)
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetOpen) {
            DaySelection(selectedDays: $selectedDays)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(.cinzaBackground)
        .cornerRadius(10)
    }
}

#Preview {
    @Previewable @State var selectedDate = Date.now
    @Previewable @State var selectedDays = [false, true, false]
    @Previewable var coordinator = GeneralCoordinator()
    DetailsSection(selectedDate: $selectedDate, selectedDays: $selectedDays).environment(coordinator)
}
