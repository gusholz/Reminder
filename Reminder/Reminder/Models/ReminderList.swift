//
//  ReminderList.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation
import SwiftData

@Model
class ReminderListDataBaseModel{
    @Attribute(.unique) var id: UUID
    var title: String
    var reminderListDescription: String
    @Relationship(deleteRule: .cascade) var reminders: [ReminderDataBaseModel] = []
    var color: String
    var icon: String
    
    init(id: UUID, title: String, description: String, color: String, icon: String, reminders: [ReminderDataBaseModel] = []) {
        self.id = id
        self.title = title
        self.reminderListDescription = description
        self.color = color
        self.icon = icon
        self.reminders = reminders
    }
}

struct ReminderList: Codable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var description: String
    var remindersId: [UUID]
    var color: String
    var icon: String
}
