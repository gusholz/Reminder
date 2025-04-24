//
//  Reminder.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 15/01/25.
//

import Foundation
import SwiftData

@Model
class ReminderDataBaseModel {
    @Attribute(.unique) var id: UUID
    var title: String
    var reminderDescription: String
    var alertTime: Date
    @Relationship(deleteRule: .cascade) var listReference: ReminderListDataBaseModel?
    
    init(id: UUID, title: String, description: String, alertTime: Date, listReference: UUID? = nil) {
        self.id = id
        self.title = title
        self.reminderDescription = description
        self.alertTime = alertTime
    }
}

struct Reminder: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String
    var alertTime: Date    
    var listReference: UUID?
}
