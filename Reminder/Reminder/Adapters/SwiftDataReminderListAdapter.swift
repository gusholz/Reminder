//
//  SwiftDataReminderListAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 24/04/25.
//

import SwiftUI
import SwiftData

class SwiftDataReminderListAdapter: DatabaseReminderListAdapter {
    private let dataContext: ModelContext
    init(dataContext: ModelContext) {
        self.dataContext = dataContext
    }
    
    func saveChanges() {
        do {
            try dataContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func createReminderList(reminder: ReminderList) {
        var reminders: [ReminderDataBaseModel] = []
        do {
            try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).forEach { dataReminder in
                if reminder.remindersId.contains(dataReminder.id) {
                    reminders.append(dataReminder)
                }
            }
        } catch{
            fatalError(error.localizedDescription)
        }
        self.dataContext.insert(ReminderListDataBaseModel(id: reminder.id, title: reminder.title, description: reminder.description, color: reminder.color, icon: reminder.icon, reminders: reminders ))
        saveChanges()
    }
    
    func getAllReminderList() -> [ReminderList] {
        do {
            let remindersListArray = try dataContext.fetch(FetchDescriptor<ReminderListDataBaseModel>()).map { reminderList in
                
                let remindersId = reminderList.reminders.map { reminder in
                    reminder.id
                }
                
                return ReminderList(id: reminderList.id, title: reminderList.title, description: reminderList.reminderListDescription, remindersId: remindersId, color: reminderList.color, icon: reminderList.icon)
            }
            
            return remindersListArray
        }catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getReminderList(id: String) -> ReminderList? {
        do {
            let remindersList = try dataContext.fetch(FetchDescriptor<ReminderListDataBaseModel>()).first { reminderList in
                reminderList.id == UUID(uuidString: id)
            }
            
            if let remindersList = remindersList{
                let remindersId = remindersList.reminders.map { reminder in
                    reminder.id
                }
                return ReminderList(id: remindersList.id, title: remindersList.title, description: remindersList.reminderListDescription, remindersId: remindersId, color: remindersList.color, icon: remindersList.icon)
            }
            
            return nil
        }catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateReminderList(id: String, updatedList: ReminderList) {
        do{
            let findedReminderList = try dataContext.fetch(FetchDescriptor<ReminderListDataBaseModel>()).first { reminderList in
                reminderList.id == UUID(uuidString: id)
            }
            guard let findedReminderList = findedReminderList else { return }
            var reminders: [ReminderDataBaseModel] = []
            try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).forEach { dataReminder in
                if updatedList.remindersId.contains(dataReminder.id) {
                    reminders.append(dataReminder)
                }
            }
            findedReminderList.color = updatedList.color
            findedReminderList.icon = updatedList.icon
            findedReminderList.reminderListDescription = updatedList.description
            findedReminderList.title = updatedList.title
            findedReminderList.reminders = reminders
            saveChanges()
            
        } catch{
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteReminderList(id: String) {
        do {
            let findedReminderList = try dataContext.fetch(FetchDescriptor<ReminderListDataBaseModel>()).first { reminderList in
                reminderList.id == UUID(uuidString: id)
            }
            
            guard let findedReminderList = findedReminderList else { return }
            
            dataContext.delete(findedReminderList)
            saveChanges()
        }catch{
            fatalError(error.localizedDescription)
        }
        
    }
    
    
    
    
}
