//
//  Profile.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation

struct Profile: Identifiable, Codable {
    var id: UUID
    var name: String
    var email: String
    var idade: Int
}
