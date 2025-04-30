//
//  ReminderCard.swift
//  Reminder
//
//  Created by Carlos Jorge on 01/04/25.
//

import SwiftUI

struct ReminderCard: View {
    var title: String
    var time: String
    var textTag: String
    var colorTag: Color = .verde
    var checkColor: Color = .verde
    var action: () -> Void
    
    
    var body: some View {
        GenericReminderCard {
            ReminderToggle(selectionColor: checkColor, action:  {
                action()
            })
        } rightContent: {
            EmptyView()
        } contentText: {
            VStack(alignment: .leading) {
                Text(title).setBdoGroteskFont(weight: .demibold, size: 14)
                    .padding(.bottom, 4)
                
                HStack {
                    Text(time).setBdoGroteskFont(weight: .light, size: 14)
                    Text(textTag).foregroundStyle(colorTag).setBdoGroteskFont(weight: .regular, size: 14)
                }
                
            }.padding(.leading, 12)
        }
    }
}

#Preview {
    @Previewable @State var isChecked: Bool = false
    ReminderCard(title: "Titulo", time: "14:00", textTag: "Tag") {
        
    }
}
