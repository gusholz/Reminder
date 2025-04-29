//
//  ReminderListViewModel.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 28/04/25.
//

import Foundation

@MainActor
@Observable
class ReminderListViewModel {
    private var db = SwiftDataAdapter.shared
    
    var reminders: [Reminder] = []
    var remindersList: [Reminder] = []
    var finishedReminderList: [Reminder] = []
    
    func createReminder(_ reminder: Reminder) {
        db.reminderAdapter.createReminder(reminder: reminder)
    }
    
    func deleteReminder(_ reminder: Reminder) {
        db.reminderAdapter.deleteReminder(id: reminder.id.uuidString)
    }
    
    func editReminder(_ reminder: Reminder) {
        db.reminderAdapter.updateReminder(id: reminder.id.uuidString, updatedReminder: reminder)
    }
    
    func getAllReminders() -> [Reminder] {
        return db.reminderAdapter.getAllReminders()
    }
    
    func getReminderById(id: String) -> Reminder? {
        return db.reminderAdapter.getReminder(id: id)
    }
}
