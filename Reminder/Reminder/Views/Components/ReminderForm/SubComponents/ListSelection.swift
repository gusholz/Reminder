//
//  ListSelection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct ListSelectionRow: View {
    @Binding var selectedList: ReminderList?
    
    var body: some View {
        HStack {
            Text("select")
                .setBdoGroteskFont(weight: .regular, size: 15)
                .foregroundStyle(.branco)
            
            Spacer()
            
            Text("list")
                .setBdoGroteskFont(weight: .regular, size: 14)
                .foregroundStyle(.cinzaLabels)
            
            IconsManager.setIcon(icon: .arrowRight)
                .foregroundStyle(.cinzaLabels)
        }
        .padding()
        .background(.cinzaBackground)
        .cornerRadius(10)
    }
}

#Preview {
    @Previewable @State var selectedList: ReminderList? = ReminderList(id: .init(), title: "Lista de compras", description: "", remindersId: [], color: "amarelo", icon: "bag")
    ListSelectionRow(selectedList: $selectedList)
}
 
