//
//  TextArea.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 31/03/25.
//

import SwiftUI

struct TextArea: View {
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("new_list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .foregroundStyle(ColorManager.setColor(.cinzaLabels))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            VStack {
                TextField(text: $title) {
                    Text("title")
                        .setSfProDisplayFont(variation: .regular, size: 17)
                        .foregroundStyle(ColorManager.setColor(.branco))
                }
                
                Divider()
                    .overlay(ColorManager.setColor(.cinzaLabels))
                
                TextField(text: $description, axis: .vertical) {
                    Text("description")
                        .setSfProDisplayFont(variation: .regular, size: 17)
                        .foregroundStyle(ColorManager.setColor(.branco))
                }
                .lineLimit(5, reservesSpace: true)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(ColorManager.setColor(.cinzaBackground))
            .cornerRadius(10)
        }
        .padding()

    }
}

#Preview {
    TextArea()
}
