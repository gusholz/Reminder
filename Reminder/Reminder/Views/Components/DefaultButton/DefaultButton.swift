//
//  DefaultButton.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 02/05/25.
//

import SwiftUI

struct DefaultButton: View {
    var label: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                action()
            } label: {
                Text(label)
                    .setBdoGroteskFont(weight: .demibold, size: 14)
                    .foregroundStyle(.cinzaBackground)
                    .textCase(.uppercase)
                    .padding()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.verde)
        )
    }
}

#Preview {
    DefaultButton(label: "create_new_list") {
        
    }
}
