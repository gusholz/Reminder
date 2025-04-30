//
//  DataBaseAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 22/04/25.
//

protocol DataBaseAdapter {
    var profileAdapter: DatabaseProfileAdapter { get }
    var userAdapter: DatabaseUserAdapter { get }
    var reminderAdapter: DatabaseReminderAdapter { get }
    var reminderListAdapter: DatabaseReminderListAdapter { get }
}

protocol DatabaseProfileAdapter {
    func createProfile(profile: Profile) -> Void
    func updateProfile(id: String, updatedProfile: Profile) -> Void
    func deleteProfile(id: String) -> Void
    func getAllProfiles() -> [Profile]
    func getProfile(id: String) -> Profile?
}

protocol DatabaseUserAdapter {
    func createUser(user: User) -> Void
    func updateUser(id: String, updatedUser: User) -> Void
    func deleteUser(id: String) -> Void
    func getAllUser() -> [User]
    func getUser(id: String) -> User?
}

protocol DatabaseReminderAdapter {
    func createReminder(reminder: Reminder) -> Void
    func getAllReminders() -> [Reminder]
    func getReminder(id: String) -> Reminder?
    func updateReminder(id: String, updatedReminder: Reminder) -> Void
    func deleteReminder(id: String) -> Void    
}

protocol DatabaseReminderListAdapter {
    func createReminderList(reminder: ReminderList) -> Void
    func getAllReminderList() -> [ReminderList]
    func getReminderList(id: String) -> ReminderList?
    func updateReminderList(id: String, updatedList: ReminderList) -> Void
    func deleteReminderList(id: String) -> Void
}
