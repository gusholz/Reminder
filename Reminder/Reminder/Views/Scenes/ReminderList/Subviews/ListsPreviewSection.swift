//
//  ListsPreviewSection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 30/04/25.
//
import SwiftUI

struct ListsPreviewSection: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel
    var reminderLists: [ReminderList]
    let rows = [
        GridItem(.flexible(minimum: 80)),
        GridItem(.flexible(minimum: 80))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("my_lists")
                .setBdoGroteskFont(weight: .demibold, size: 18)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    if reminderLists.isEmpty {
                        Text("no_lists")
                            .setBdoGroteskFont(weight: .medium, size: 16)
                    } else {
                        ForEach(reminderLists, id: \.self) { list in
                            Button {
                                reminderListViewModel.selectedReminderList = list
                                coordinator.navigate(to: .listDetailView)
                            } label: {
                                ListCard(
                                    color: (list.color.extractColorFromNamedColor() ?? list.color.extractRGBColor()) ?? Color(.branco),
                                    icon: IconsManager.getIcon(iconString: list.icon),
                                    title: list.title
                                )
                            }
                        }
                    }
                }
            }
            .frame(height: 180)
        }
    }
}
