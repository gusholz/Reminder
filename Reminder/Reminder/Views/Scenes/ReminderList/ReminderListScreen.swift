//
//  ReminderListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 09/04/25.
//

import SwiftUI

struct ReminderListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    
    let rows = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]

    @State private var outerList: [ReminderList] = mockListFactory()
    @State private var innerList: [Bool] = [false, false, false]
    
    let todatReminderList: [Reminder] = mockReminderFactory()
    let recentReminderList: [Reminder] = mockReminderFactory("Pagar conta de luz")

    
    var body: some View {
        ScrollView(.vertical) {
            // Lists list section
            VStack(alignment: .leading) {
                Text("my_lists")
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(outerList, id: \.self) { list in
                            Button {
                                // Go to List View
                                print("Okay computer:", list.title)
                            } label: {
                                ListCard(color: list.color.toColor(), icon: IconsManager.setIcon(icon: .bag), title: list.title)
                            }
                        }
                    }
                }
                .frame(height: 180)
            }
            
            Divider()
                .overlay(.cinzaLabels)
            
            // Today Reminder Section
            VStack(alignment: .leading) {
                Text("for_today")
                    .foregroundStyle(.branco)
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                ForEach(todatReminderList, id: \.id) { reminder in
                    // TODO: Criar função auxiliar que modifica a colorTag com base na cor da reminderList pai do reminder em questão
                    // TODO: Ao modificar esse state, o reminder deve ser finalizado
                    ReminderCard(isChecked: $innerList[0], title: reminder.title, time: "12:45", textTag: reminder.description, colorTag: .amarelo)
                        .padding(.bottom, 24)
                }
            }
            
            Divider()
                .overlay(.cinzaLabels)
            
            // Recents Reminder Section
            VStack(alignment: .leading) {
                Text("recents")
                    .foregroundStyle(.branco)
                    .setBdoGroteskFont(weight: .demibold, size: 18)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                ForEach(recentReminderList, id: \.id) { reminder in
                    ReminderCard(isChecked: .constant(false), title: reminder.title, time: "12:45", textTag: reminder.description)
                        .padding(.bottom, 24)
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image("logo")
            }
                        
            ToolbarItemGroup {
                HStack {
                    Button {
                        
                    } label: {
                        IconsManager.setIcon(icon: .gear)
                    }
                    
                    Spacer()
                    
                    Button {
                        coordinator.present(sheet: .createReminderSheet)
                    } label: {
                        IconsManager.setIcon(icon: .plusCircle)
                    }
                    
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ReminderListScreen().environment(coordinator)
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ReminderListScreen().environment(coordinator)
    }
}
