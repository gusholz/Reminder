//
//  DaySelection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 04/04/25.
//

import SwiftUI

enum DaysOfTheWeek: String, CaseIterable, Identifiable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var id: String { return self.rawValue}
}

struct DaySelection: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Binding var selectedDays: [Bool]
    
    var body: some View {
        VStack {
            GenericNavBar(title: "repetition", actionTitle: "", saveAction: {}, dismissAction: {
                coordinator.dismissSheet()
            }, hasSaveAction: false)
            
            ForEach(Array(DaysOfTheWeek.allCases.enumerated()), id: \.element.id) { index, day in
                HStack {
                    Text(day.rawValue.capitalized)
                        .setBdoGroteskFont(weight: .regular, size: 15)
                        .foregroundStyle(.branco)
                    Spacer()
                    Checkbox(isChecked: $selectedDays[index])
                }
                
                Divider()

            }
        }
        .padding()
        .background(.cinzaBackground)
    }
}
