//
//  ContextMenu.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 07/05/25.
//

import SwiftUI

struct ReminderListContextMenu: View {
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                HStack {
                    Text("delete")
                    IconsManager.setIcon(icon: .trash)
                }
            }
        }
    }
}

#Preview {
    ReminderListContextMenu {
        
    }
}
