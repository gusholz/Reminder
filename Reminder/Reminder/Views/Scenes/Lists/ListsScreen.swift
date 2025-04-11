//
//  ListsScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 10/04/25.
//

import SwiftUI

struct ListsScreen: View {
    @State private var outerList: [ReminderList] = mockListFactory()
    var isSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                ForEach(outerList, id: \.self) { list in
                    Button {
                        if isSheet {
                            // Make viewModel.selectedList = list
                            return
                        }
                        // Go to List View
                        print("Okay computer:", list.title)
                        
                    } label: {
                        ListCard(color: list.color.toColor(), icon: IconsManager.setIcon(icon: .bag), title: list.title)
                            .padding(.bottom, 8)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ListsScreen()
}
