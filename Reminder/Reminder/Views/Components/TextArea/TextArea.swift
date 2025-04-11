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
            
            VStack {
                TextField(text: $title) {
                    Text("title")
                        .setSfProDisplayFont(variation: .regular, size: 17)
                        .foregroundStyle(.branco)
                }
                
                Divider()
                    .overlay(.cinzaLabels)
                
                TextField(text: $description, axis: .vertical) {
                    Text("description")
                        .setSfProDisplayFont(variation: .regular, size: 17)
                        .foregroundStyle(.branco)
                }
                .lineLimit(5, reservesSpace: true)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(.cinzaBackground)
            .cornerRadius(10)
        }

    }
}

#Preview {
    TextArea()
}
