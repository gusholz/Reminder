//
//  Reminder.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 15/01/25.
//

import Foundation

struct Reminder: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String
    var alertTime: Date    
    var listReference: UUID?
}
