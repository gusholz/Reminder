//
//  Profile.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation
import SwiftData

@Model
class ProfileDataBaseModel {
    @Attribute(.unique) var id: UUID
    var name: String
    var email: String
    var idade: Int
    
    init(id: UUID, name: String, email: String, idade: Int) {
        self.id = id
        self.name = name
        self.email = email
        self.idade = idade
    }
    
    
}

struct Profile: Identifiable, Codable {
    var id: UUID
    var name: String
    var email: String
    var idade: Int
}
