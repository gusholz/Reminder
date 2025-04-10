//
//  ReminderListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 09/04/25.
//

import SwiftUI

func mockListFactory() -> [ReminderList] {
    let shoppingList1 = ReminderList(
        id: .init(),
        title: "Compras do mês",
        description: "Falta experimentar essa parte do app!",
        remindersId: [.init(), .init(), .init()],
        color: "verde",
        icon: ""
    )
    
    let shoppingList2 = ReminderList(
        id: .init(),
        title: "Remédios do mês",
        description: "Posso verificar se a cor mudar de acordo com o tema!",
        remindersId: [.init(), .init(), .init()],
        color: "laranja",
        icon: ""
    )
    
    let shoppingList3 = ReminderList(
        id: .init(),
        title: "Contas do mês",
        description: "Isso ta sendo modificado corretamente?!",
        remindersId: [.init(), .init(), .init()],
        color: "magenta",
        icon: ""
    )
    
    return [shoppingList1, shoppingList2, shoppingList3]
}
func mockReminderFactory(_ titleText: String = "Comprar leite") -> [Reminder] {
    var reminders: [Reminder] = []
    
    for _ in 0..<3 {
        reminders.append(
            Reminder(
                id: .init(),
                title: titleText,
                description: "Isso ta sendo modificado corretamente?!",
                alertTime: .now,
                listReference: UUID()
            )
        )
    }
    
    return reminders
}


struct ReminderListScreen: View {
    
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
        .padding()
    }
}

#Preview {
    ReminderListScreen()
}
