//
//  SwiftDataUserAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 24/04/25.
//
import SwiftUI
import SwiftData

class SwiftDataUserAdapter: DatabaseUserAdapter{
    private let dataContext: ModelContext

    init(dataContext: ModelContext) {
        self.dataContext = dataContext
    }
    
    func createUser(user: User) {
        do{
            let dataProfile = try self.dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).first { profile in
                profile.id == user.profile.id
            }
            guard let dataProfile = dataProfile else { return }
            dataContext.insert(UserDataBaseModel(id: user.id, profile: dataProfile))
            self.saveChanges()
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func updateUser(id: String, updatedUser: User) {
        do {
            let userFinded = try dataContext.fetch(FetchDescriptor<UserDataBaseModel>()).first(where: { dataUser in
                return dataUser.id == UUID(uuidString: id)
            })
            
            let dataProfile = try self.dataContext.fetch(FetchDescriptor<ProfileDataBaseModel>()).first { profile in
                profile.id == updatedUser.profile.id
            }
            
            guard let element = userFinded, let dataProfile = dataProfile else { return }
            element.profile = dataProfile
            
            saveChanges()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteUser(id: String) {
        do {
            let userFinded = try dataContext.fetch(FetchDescriptor<UserDataBaseModel>()).first(where: { dataUser in
                return dataUser.id == UUID(uuidString: id)
            })
            guard let userFinded = userFinded else { return }
            dataContext.delete(userFinded)
            saveChanges()
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getAllUser() -> [User] {
        do {
            return try dataContext.fetch(FetchDescriptor<UserDataBaseModel>()).map { user in
                return User(id: user.id, profile: Profile(id: user.profile.id, name: user.profile.name, email: user.profile.email, idade: user.profile.idade))
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getUser(id: String) -> User? {
        do {
            let dataElement = try dataContext.fetch(FetchDescriptor<UserDataBaseModel>()).first(where: { user in
                return user.id == UUID(uuidString: id)
            })
            if let user = dataElement{
                return User(id: user.id, profile: Profile(id: user.profile.id, name: user.profile.name, email: user.profile.email, idade: user.profile.idade))
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
