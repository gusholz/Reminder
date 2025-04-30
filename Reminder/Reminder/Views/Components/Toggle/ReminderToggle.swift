//
//  ReminderTouggle.swift
//  Reminder
//
//  Created by Carlos Jorge on 01/04/25.
//

import SwiftUI

struct ReminderToggle: View {
    @State var isChecked: Bool = false
    var selectionColor: Color = .green
    var action: () -> Void

    
    var body: some View {
        Circle()
            .stroke(.branco, lineWidth: 2)
            .frame(width: 24, height: 24).overlay {
                if isChecked {
                    Circle().frame(width: 14, height: 14).foregroundColor(selectionColor)
                }
            }
            .onTapGesture {
                withAnimation {
                    isChecked = !isChecked
                    action()
                }
                
            }
    }
}

#Preview {
    @Previewable @State var boolean: Bool = false
    ReminderToggle(isChecked: boolean, action: {print("hi!")})
}
