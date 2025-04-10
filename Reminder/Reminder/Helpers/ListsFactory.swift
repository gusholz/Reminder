//
//  ListsFactory.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
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
