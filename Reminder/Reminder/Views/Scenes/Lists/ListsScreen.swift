//
//  ListsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct ListsScreen: View {
    @Environment(GeneralCoordinator.self) var coordinator
    @State private var outerList: [ReminderList] = mockListFactory()
    var isSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical) {
                ForEach(outerList, id: \.self) { list in
                    Button {
                        if isSheet {
                            // Make viewModel.selectedList = list
                            return
                        }
                        coordinator.navigate(to: .listDetailView)
                        
                    } label: {
                        ListCard(color: list.color.toColor(), icon: IconsManager.setIcon(icon: .bag), title: list.title)
                            .padding(.bottom, 8)
                    }
                }
            }
            
            if !isSheet {
                Button {
                    coordinator.navigate(to: .createListSheet)
                } label: {
                    Text("create_new_list")
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("my_lists")
                    .setBdoGroteskFont(weight: .medium, size: 20)
            }
            
            ToolbarItem {
                IconsManager.setIcon(icon: .plusCircleFilled)
                    .font(.system(size: 26))
                    .foregroundStyle(.verde)
                    .onTapGesture {
                        coordinator.navigate(to: .createReminderSheet)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ListsScreen().environment(coordinator)
    }
    
}
