//
//  User.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id: UUID
    var profile: Profile
}
