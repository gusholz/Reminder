//
//  CreateReminderScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct CreateReminderScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator

    var body: some View {
        VStack {
            SheetNavBar(title: "Novo Lembrete", actionTitle: "Salvar", saveAction: {
                
            })
                .padding()
            ReminderForm()
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    CreateReminderScreen().environment(coordinator)
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        CreateReminderScreen().environment(coordinator)
    }
}
