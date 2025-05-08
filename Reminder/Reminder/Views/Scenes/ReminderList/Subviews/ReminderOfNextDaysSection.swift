//
//  ReminderOfNextDaysSection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 30/04/25.
//

import SwiftUI

struct ReminderOfNextDaysSection: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("next_days")
                .foregroundStyle(.branco)
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            if reminderListViewModel.reminders.filter({!reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}).isEmpty {
                Text("no_reminders_for_the_next_days")
                    .setBdoGroteskFont(weight: .medium, size: 16)
            } else {
                ForEach(reminderListViewModel.reminders.filter { !reminderListViewModel.isReminderForToday($0.alertTime) && !$0.isFinished}, id: \.id) { reminder in
                    ReminderCard(
                        title: reminder.title,
                        time: reminder.alertTime.formattedHourAndDay,
                        textTag: reminder.description,
                        colorTag: reminderListViewModel.getColorFromList(reminder: reminder),
                        action: {
                            reminderListViewModel.finishReminder(reminder.id)
                    })
                    .contextMenu {
                        ReminderListContextMenu {
                            reminderListViewModel.deleteReminder(reminder)
                            reminderListViewModel.reminders = reminderListViewModel.getAllReminders()
                            reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
                        }
                    }
                    .padding(.bottom, 24)
                }
            }
        }
    }
}

#Preview {
    ReminderOfNextDaysSection()
}
