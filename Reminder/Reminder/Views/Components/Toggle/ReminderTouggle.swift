//
//  ReminderTouggle.swift
//  Reminder
//
//  Created by Carlos Jorge on 01/04/25.
//

import SwiftUI

struct ReminderTouggle: View {
    var selectionColor: Color = .green
    @Binding var isChecked: Bool
    var body: some View {
        Circle()
            .stroke(ColorManager.setColor(.branco), lineWidth: 2)
            .frame(width: 24, height: 24).overlay {
                if isChecked {
                    Circle().frame(width: 14, height: 14).foregroundColor(selectionColor)
                }
            }
            .onTapGesture {
                withAnimation {
                    isChecked = !isChecked
                }
                
            }
    }
}

#Preview {
    ReminderTouggle(isChecked: .constant(false))
}
