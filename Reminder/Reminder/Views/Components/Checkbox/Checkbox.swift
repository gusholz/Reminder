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
            Circle()
                .foregroundStyle(isChecked ? .cinzaBackground : .branco)
                .frame(width: 26, height: 26)
                .overlay {
                    if isChecked {
                        IconsManager.setIcon(icon: .checkmark)
                            .font(.system(size: 26))
                            .tint(.verde)
                    } else {
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
}
