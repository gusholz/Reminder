//
//  SwiftDataReminderAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 24/04/25.
//

import SwiftUI
import SwiftData


class SwiftDataReminderAdapter: DatabaseReminderAdapter {
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
    
    func createReminder(reminder: Reminder) {
        dataContext.insert(ReminderDataBaseModel(id: reminder.id, title: reminder.title, description: reminder.description, alertTime: reminder.alertTime, listReference: reminder.listReference))
        self.saveChanges()
    }
    
    func updateReminder(id: String, updatedReminder: Reminder) {
        do {
            let reminderFinded = try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).first(where: { dataReminder in
                return dataReminder.id == UUID(uuidString: id)
            })
            guard let element = reminderFinded else { return }
            
            element.title = updatedReminder.title
            element.alertTime = updatedReminder.alertTime
            element.reminderDescription = updatedReminder.description
            element.isFinished = updatedReminder.isFinished
            do{
                element.listReference = try dataContext.fetch(FetchDescriptor<ReminderListDataBaseModel>()).first { reminderList in
                    return reminderList.id == updatedReminder.listReference
                }
                
            }catch {
                fatalError(error.localizedDescription)
            }
             
            
            saveChanges()
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteReminder(id: String) {
        do{
            let findedReminder = try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).first { reminder in
                reminder.id == UUID(uuidString: id)
            }
            
            guard let findedReminder = findedReminder else { return }
            dataContext.delete(findedReminder)
            saveChanges()
            
        }catch{
            fatalError(error.localizedDescription)
        }
    }
    
    func getAllReminders() -> [Reminder] {
        do {
            return try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).map { reminder in
                return Reminder(id: reminder.id, title: reminder.title, description: reminder.reminderDescription, alertTime: reminder.alertTime, listReference: reminder.listReference?.id, isFinished: reminder.isFinished)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getReminder(id: String) -> Reminder? {
        do {
            let dataElement = try dataContext.fetch(FetchDescriptor<ReminderDataBaseModel>()).first(where: { dataReminder in
                return dataReminder.id == UUID(uuidString: id)
            })
            if let reminder = dataElement{
                return Reminder(id: reminder.id, title: reminder.title, description: reminder.reminderDescription, alertTime: reminder.alertTime, isFinished: reminder.isFinished)
            }
            return nil
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
}
