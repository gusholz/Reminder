//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct EditListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    @State var title: String = ""
    @State var description: String = ""
    @State var color: Color = .laranja
    @State var listIcon: ProjectIcons = .bulletList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            GenericNavBar(title: "edit_list", actionTitle: "save") {
                if title.isEmpty {
                    return
                }
                
                let updatedList = ReminderList(id: UUID.init(), title: title, description: description, remindersId: [], color: color.toString(), icon: listIcon.rawValue)
                
                if let selectedList = reminderListViewModel.selectedReminderList {
                    reminderListViewModel.editReminderList(
                        selectedList.id.uuidString,
                        updatedList: updatedList
                    )
                }
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
        .onAppear {
            if let selectedList = reminderListViewModel.selectedReminderList {
                title = selectedList.title
                description = selectedList.description
                listIcon = IconsManager.iconFromString(selectedList.icon) ?? .ant
                
                if let namedColor = selectedList.color.extractColorFromNamedColor() {
                    color = namedColor
                } else if let rgbColor = selectedList.color.extractRGBColor() {
                    color = rgbColor
                } else {
                    color = .blue
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    EditListScreen()
}
