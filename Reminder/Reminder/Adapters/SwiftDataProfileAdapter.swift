//
//  SwiftDataProfileAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 24/04/25.
//

import SwiftUI
import SwiftData


class SwiftDataProfileAdapter: DatabaseProfileAdapter {
    init(dataContext: ModelContext) {
        self.dataContext = dataContext
    }
    private let dataContext: ModelContext
    func createProfile(profile: Profile) {
        dataContext.insert(ProfileDataBaseModel(id: profile.id, name: profile.name, email: profile.email, idade: profile.idade))
        self.saveChanges()
    }
    
    func updateProfile(id: String, updatedProfile: Profile) {
        do {
            let profileFinded = try dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).first(where: { dataProfile in
                return dataProfile.id == UUID(uuidString: id)
            })
            guard let element = profileFinded else { return }
            
            element.email = updatedProfile.email
            element.idade = updatedProfile.idade
            element.name = updatedProfile.name
            
            saveChanges()
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteProfile(id: String) {
        do {
            let profileFinded = try dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).first(where: { dataProfile in
                return dataProfile.id == UUID(uuidString: id)
            })
            guard let profileFinded = profileFinded else { return }
            dataContext.delete(profileFinded)
            
            saveChanges()
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getAllProfiles() -> [Profile] {
        do {
            return try dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).map { profile in
                return Profile(id: profile.id, name: profile.name, email: profile.email, idade: profile.idade)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getProfile(id: String) -> Profile? {
        do {
            let dataElement = try dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).first(where: { dataProfile in
                return dataProfile.id == UUID(uuidString: id)
            })
            if let dataElement = dataElement{
                return Profile(id: dataElement.id, name: dataElement.name, email: dataElement.email, idade: dataElement.idade)
            }
            return nil
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func saveChanges() {
        do {
            try dataContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
