//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct EditListScreen: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var color: Color = .laranja
    @State var listIcon: ProjectIcons = .bulletList
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("new_list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            TextArea(title: $title, description: $description)
            
            Divider()
                .overlay(.cinzaLabels)
            
            ColorCarousel(selectedColor: $color)
            
            Divider()
                .overlay(.cinzaLabels)
            
            IconCarousel(selectedIcon: $listIcon)
        }
    }
}

#Preview {
    EditListScreen()
}
