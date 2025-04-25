//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct CreateListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            GenericNavBar(title: "new_list", actionTitle: "save") {
                
            } dismissAction: {
                coordinator.pop()
            }
            
            Text("new_list")
                .setSfProDisplayFont(variation: .regular, size: 12)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .foregroundStyle(.cinzaLabels)
            
            TextArea()
            
            Divider()
                .overlay(.cinzaLabels)
            
            ColorCarousel()
            
            Divider()
                .overlay(.cinzaLabels)
            
            IconCarousel()
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    CreateListScreen().environment(coordinator)
}
