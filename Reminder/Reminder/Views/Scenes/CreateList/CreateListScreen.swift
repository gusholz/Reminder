//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct CreateListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    @State var title: String = ""
    @State var description: String = ""
    @State var color: Color = .laranja
    @State var listIcon: ProjectIcons = .bulletList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            GenericNavBar(title: "new_list", actionTitle: "save") {
                if title.isEmpty {
                    return
                }
            
                let newList = ReminderList(id: .init(), title: title, description: description, remindersId: [], color: color.toString(), icon: listIcon.rawValue)
                reminderListViewModel.createReminderList(list: newList)
                coordinator.pop()
            } dismissAction: {
                coordinator.pop()
            }
            
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
