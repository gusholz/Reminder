//
//  ReminderCard.swift
//  Reminder
//
//  Created by Carlos Jorge on 01/04/25.
//

import SwiftUI

struct ReminderCard: View {
    @Binding var isChecked: Bool
    var title: String
    var time: String
    var textTag: String
    var colorTag: Color = .verde
    var checkColor: Color = .verde
    var body: some View {
        GenericReminderCard {
            ReminderTouggle(selectionColor: checkColor, isChecked: $isChecked)
        } rightContent: {
            EmptyView()
        } contentText: {
            VStack(alignment: .leading) {
                Text(title).setBdoGroteskFont(weight: .demibold, size: 14)
                    .padding(.bottom, 4)
                HStack{
                    Text(time).setBdoGroteskFont(weight: .light, size: 14)
                    Spacer().frame(width: 24)
                    Text(textTag).foregroundStyle(colorTag).setBdoGroteskFont(weight: .regular, size: 14)
                        
                }.padding(0)
            }.padding(.leading, 12)
        }

    }
}

#Preview {
    ReminderCard(isChecked: .constant(false), title: "Titulo", time: "14:00", textTag: "Tag")
}
