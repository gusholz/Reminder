//
//  SelectListScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 29/04/25.
//

import SwiftUI

struct SelectListScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical) {
                if reminderListViewModel.remindersLists.isEmpty {
                    Text("no_lists_created_yet")
                } else {
                    ForEach(reminderListViewModel.remindersLists, id: \.self) { list in
                        Button {
                            reminderListViewModel.selectedReminderList = list
                            isSheetOpen.toggle()
                        } label: {
                            ListCard(color: list.color.extractColorFromNamedColor() ?? list.color.extractRGBColor() ?? Color(.branco), icon: IconsManager.getIcon(iconString: list.icon), title: list.title)
                                .padding(.bottom, 8)
                        }
                    }
                    Button {
                        reminderListViewModel.selectedReminderList = nil
                        isSheetOpen = false;
                    } label: {
                        Text("no_lists")
                            .foregroundStyle(.branco)
                            .padding()
                            .background(.cinzaBackground)
                            .cornerRadius(8)
                    }

                }
            }
        }
        .padding()
    }
}
