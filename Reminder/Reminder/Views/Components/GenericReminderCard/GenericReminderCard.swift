//
//  GenericReminderCard.swift
//  Reminder
//
//  Created by Carlos Jorge on 31/03/25.
//

import SwiftUI

struct GenericReminderCard<Content: View, ContentRight: View, ContentText: View>: View {
    var leftContent: () -> Content
    var rightContent: () -> ContentRight
    var contentText: () -> ContentText
    var hasIconDivider = false
    var body: some View {
        HStack{
            leftContent()
            if hasIconDivider {
                Rectangle().frame(width: 2)
            }
            contentText()
            Spacer()
            rightContent()
        }
        .padding(.vertical, 20)
        .padding(.leading, 16)
        .background(.backgroundCard)
        .cornerRadius(10)
        .foregroundColor(.white)
        .frame(height: 70)
    }
}

#Preview {
    GenericReminderCard(leftContent: {
        Text("A")
    }, rightContent: {
        Text("B")
    }, contentText: {
        Text("C")
    }, hasIconDivider: true).padding()
}
