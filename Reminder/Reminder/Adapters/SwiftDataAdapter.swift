//
//  SwiftDataAdapter.swift
//  Reminder
//
//  Created by Carlos Jorge on 22/04/25.
//

import SwiftUI
import SwiftData

class SwiftDataAdapter: DataBaseAdapter {
    private let dataContainer: ModelContainer
    private let dataContext: ModelContext
    
    var profileAdapter: any DatabaseProfileAdapter
    var userAdapter: any DatabaseUserAdapter
    var reminderAdapter: any DatabaseReminderAdapter
    var reminderListAdapter: any DatabaseReminderListAdapter
    
    @MainActor
    static let shared = SwiftDataAdapter()
    
    @MainActor
    private init() {
        self.dataContainer = try! ModelContainer(for: ProfileDataBaseModel.self, ReminderDataBaseModel.self, ReminderListDataBaseModel.self, UserDataBaseModel.self)
        self.dataContext = dataContainer.mainContext
        self.profileAdapter = SwiftDataProfileAdapter(dataContext: self.dataContext)
        self.userAdapter = SwiftDataUserAdapter(dataContext: self.dataContext)
        self.reminderAdapter = SwiftDataReminderAdapter(dataContext: self.dataContext)
        self.reminderListAdapter = SwiftDataReminderListAdapter(dataContext: self.dataContext)
    }
    
    func saveChanges() {
        do {
            try dataContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
