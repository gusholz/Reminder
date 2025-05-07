//
//  ListDetailsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 22/04/25.
//

import SwiftUI

struct ListDetailsScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @Environment(ReminderListViewModel.self) var reminderListViewModel

    // @Binding var reminderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Substituir por reminderList.name e reminderList.description
            Text(reminderListViewModel.selectedReminderList?.title ?? "Unknown List")
                .setBdoGroteskFont(weight: .medium, size: 30)
                .padding(.bottom, 12)
            Text(reminderListViewModel.selectedReminderList?.description ?? "")
                .setBdoGroteskFont(weight: .regular, size: 14)
            
            Divider()
                .overlay(.branco)
                .padding(.bottom, 8)
            
            ScrollView {
                ForEach(reminderListViewModel.reminders, id: \.id) { reminder in
                    ReminderCard(title: reminder.title, time: "12:45", textTag: reminder.description, action: {
                        
                    })
                        .padding(.bottom, 24)
                }
            }
            
            Spacer()
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                IconsManager.setIcon(icon: .arrowLeft)
                    .frame(width: 54, alignment: .leading)
                    .onTapGesture {
                        coordinator.pop()
                    }
            }
            
            ToolbarItem {
                HStack {
                    IconsManager.setIcon(icon: .circleWithThreeDots)
                        .frame(width: 54, alignment: .leading)
                        .onTapGesture {
                            print("Ohiyo!!")
                        }
                    IconsManager.setIcon(icon: .plusCircleFilled)
                        .frame(width: 54, alignment: .leading)
                        .onTapGesture {
                            print("Ohiyo!!")
                        }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(reminderListViewModel.getColorFromSelectedList(), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
