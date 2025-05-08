//
//  DataScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 30/04/25.
//

import SwiftUI


struct DataScreen: View {
    @Environment(ReminderListViewModel.self) var reminderListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("last_lists")
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .foregroundStyle(.branco)
            
            ScrollView(.vertical) {
                ForEach(reminderListViewModel.reminders.filter { $0.isFinished == true }, id: \.id) { reminder in
                    ReminderCard(
                        title: reminder.title,
                        time: reminder.alertTime.formatted(date: .omitted, time: .standard),
                        textTag: reminder.description,
                        colorTag: reminderListViewModel.getColorFromList(reminder: reminder),
                        hasToggle: false,
                        action: {
                        
                    })
                    .padding(.bottom, 24)
                }
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("data")
                    .setBdoGroteskFont(weight: .medium, size: 20)
            }
        }
    }
}

#Preview {
    DataScreen()
}
