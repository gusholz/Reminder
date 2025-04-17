//
//  ReminderList.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation

struct ReminderList: Codable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var description: String
    var remindersId: [UUID]
    var color: String
    var icon: String
}
