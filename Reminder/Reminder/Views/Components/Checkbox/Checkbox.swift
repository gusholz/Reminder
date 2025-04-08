//
//  checkbox.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 07/04/25.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            if isChecked {
                Circle()
                    .foregroundStyle(.branco)
                    .frame(width: 26, height: 26)
            } else {
                ZStack {
                    Circle()
                        .foregroundStyle(.branco)
                        .frame(width: 26, height: 26)
                    Circle()
                        .foregroundStyle(.cinzaBackground)
                        .frame(width: 22, height: 22)
                    
                }
            }
        }

    }
}

#Preview {
    @Previewable @State var boolean: Bool = false
    Checkbox(isChecked: $boolean)
        .padding()
        .background(.verde)
}
