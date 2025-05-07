//
//  ReminderListViewModel.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 28/04/25.
//

import Foundation
import SwiftUI

@MainActor
@Observable
class ReminderListViewModel {
    private var db = SwiftDataAdapter.shared
    
    var reminders: [Reminder] = []
    var remindersLists: [ReminderList] = []
    var selectedReminderList: ReminderList?
    
    func createReminder(_ reminder: Reminder) {
        db.reminderAdapter.createReminder(reminder: reminder)
        selectedReminderList = nil
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
    
    func getColorFromSelectedList() -> Color {
        guard let selectedList = selectedReminderList else {
            return .cinzaLabels
        }
        return selectedList.color.extractColorFromNamedColor() ?? selectedList.color.extractRGBColor() ?? Color(.cinzaLabels)
    }
    
    func getColorFromList(reminder: Reminder) -> Color {
        guard let id = reminder.listReference?.uuidString else {
            return .cinzaLabels
        }
        let reminderList = self.getReminderListById(id)
 
        return (reminderList?.color.extractColorFromNamedColor() ?? reminderList?.color.extractRGBColor()) ?? Color(.cinzaLabels)
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
    
    func getReminderListById(_ id: String) -> ReminderList? {
        return db.reminderListAdapter.getReminderList(id: id)
    }
    
    func getAllRemindersLists() -> [ReminderList] {
        return db.reminderListAdapter.getAllReminderList()
    }
    
    func createReminderList(list: ReminderList) {
        db.reminderListAdapter.createReminderList(reminder: list)
    }
    
    func deleteReminderList(_ id: String) {
        db.reminderListAdapter.deleteReminderList(id: id);
        self.remindersLists = getAllRemindersLists()
    }
    
    func editReminderList(_ id: String, updatedList: ReminderList) {
        db.reminderListAdapter.updateReminderList(id: id, updatedList: updatedList)
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
