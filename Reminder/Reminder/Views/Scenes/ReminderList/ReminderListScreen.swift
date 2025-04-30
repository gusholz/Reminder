//
//  ReminderListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 09/04/25.
//

import SwiftUI

struct ReminderListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel

    var body: some View {
        ScrollView(.vertical) {
            ListsPreviewSection(reminderLists: reminderListViewModel.remindersLists)
            
            Divider()
                .overlay(.cinzaLabels)
            
            RemindersOfTheDaySection()
            
            Divider()
                .overlay(.cinzaLabels)
            
            RemindersOfTheDaySection()
        }
        .task {
            reminderListViewModel.reminders = reminderListViewModel.getAllReminders()
            reminderListViewModel.remindersLists = reminderListViewModel.getAllRemindersLists()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image("logo")
            }
            
            ToolbarItemGroup {
                HStack {
                    Button {
                        coordinator.navigate(to: .configurations)
                    } label: {
                        IconsManager.setIcon(icon: .gear)
                            .foregroundStyle(.branco)
                            .font(.system(size: 26))
                    }
                    
                    Spacer()
                    
                    Button {
                        coordinator.navigate(to: .createReminderSheet)
                    } label: {
                        IconsManager.setIcon(icon: .plusCircleFilled)
                            .font(.system(size: 26))
                            .foregroundStyle(.verde)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var viewModel = ReminderListViewModel()
    @Previewable var coordinator = GeneralCoordinator()
    ReminderListScreen().environment(coordinator).environment(viewModel)
}

#Preview {
    @Previewable var viewModel = ReminderListViewModel()
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ReminderListScreen().environment(coordinator).environment(viewModel)
    }
}
