//
//  CreateReminderScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct CreateReminderScreen: View {
    var body: some View {
        VStack {
            ReminderForm()
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    CreateReminderScreen().environment(coordinator)
}
