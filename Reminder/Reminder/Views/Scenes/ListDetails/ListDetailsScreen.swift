//
//  ListDetailsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 22/04/25.
//

import SwiftUI

struct ListDetailsScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    let recentReminderList: [Reminder] = mockReminderFactory("Pagar conta de luz")
    // @Binding var reminderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Substituir por reminderList.name e reminderList.description
            Text("List name")
                .setBdoGroteskFont(weight: .medium, size: 30)
                .padding(.bottom, 12)
            Text("List description")
                .setBdoGroteskFont(weight: .regular, size: 14)
            
            Divider()
                .overlay(.branco)
                .padding(.bottom, 8)
            
            ScrollView {
                ForEach(recentReminderList, id: \.id) { reminder in
                    ReminderCard(isChecked: .constant(false), title: reminder.title, time: "12:45", textTag: reminder.description)
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
            
            ToolbarItem {
                
            }
        }
        .navigationBarBackButtonHidden()
        // TODO: Update to use the ReminderListThemeColor
        .toolbarBackground(.laranja, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ListDetailsScreen().environment(coordinator)
    }
}
