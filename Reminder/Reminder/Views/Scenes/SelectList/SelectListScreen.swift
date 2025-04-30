//
//  SelectListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 29/04/25.
//

import SwiftUI

struct SelectListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    // @Binding var remindersList: [ReminderList]
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical) {
//                if remindersList.isEmpty {
//                    Text("Nenhuma lista criada até o momento 🤝")
//                } else {
//                    ForEach(remindersList, id: \.self) { list in
//                        Button {
//                            action()
//                        } label: {
//                            ListCard(color: list.color.extractColorFromNamedColor() ?? Color(.branco), icon: IconsManager.getIcon(iconString: list.icon), title: list.title)
//                                .padding(.bottom, 8)
//                        }
//                    }
//                }
            }
        }
        .padding()
    }
}
