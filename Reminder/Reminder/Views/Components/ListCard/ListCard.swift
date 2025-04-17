//
//  ReminderCard.swift
//  Reminder
//
//  Created by Carlos Jorge on 01/04/25.
//

import SwiftUI

struct ListCard: View {
    var color: Color
    var icon: Image
    var title: String
    
    var body: some View {
        GenericReminderCard(leftContent: {
            icon
        }, rightContent: {
            EmptyView()
        }, contentText: {
            Text(title)
                .setBdoGroteskFont(weight: .medium, size: 14)
                .padding(.trailing, 16)
        },
        hasIconDivider: true)
        .overlay {
            HStack{
                Spacer()
                UnevenRoundedRectangle(
                    bottomTrailingRadius:8, topTrailingRadius: 8
                )
                .frame(width: 14)
                .foregroundColor(color)
            }
        }
    }
}

#Preview {
    ListCard(color: .red, icon: IconsManager.setIcon(icon: .clock), title: "Testando aqui se agora vai ta ligado pode crRE dse ")
}
