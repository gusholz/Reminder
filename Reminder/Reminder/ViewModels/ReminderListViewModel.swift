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
    var remindersLists: [ReminderList] = []
    var selectedReminderList: ReminderList?
    
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
    
    func finishReminder(_ reminderId: UUID) {
        guard let index = reminders.firstIndex(where: { selectedReminder in
            selectedReminder.id == reminderId
        }) else {
            print("Unable to find the selected Reminder from its id")
            return
        }
        
        reminders[index].isFinished = true;
        editReminder(reminders[index]);
        print(reminders)
    }
    
    func isReminderForToday(_ date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }
    
    func getAllRemindersLists() -> [ReminderList] {
        return db.reminderListAdapter.getAllReminderList()
    }
    
    func createReminderList(list: ReminderList) {
        db.reminderListAdapter.createReminderList(reminder: list)
    }
    
    func getAllRemindersFromList(reminderIds: [String]) -> [Reminder] {
        var remindersFromList: [Reminder] = []
        for id in reminderIds {
            guard let reminder = getReminderById(id: id) else {
                return []
            }
            remindersFromList.append(reminder)
        }
        
        return remindersFromList
    }
}
