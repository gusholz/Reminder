//
//  User.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 26/03/25.
//

import Foundation
import SwiftData

@Model
class UserDataBaseModel {
    @Attribute(.unique) var id: UUID
    @Relationship(deleteRule: .cascade) var profile: ProfileDataBaseModel
    
    init(id: UUID, profile: ProfileDataBaseModel) {
        self.id = id
        self.profile = profile
        
    }
}

struct User: Identifiable, Codable {
    var id: UUID
    var profile: Profile
}
