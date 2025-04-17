//
//  SwiftUIView.swift
//  Reminder
//
//  Created by Carlos Jorge on 08/04/25.
//

import SwiftUI
enum PageTab {
    case reminders, lists, data
}

struct TabBarView: View {
    @Binding var selectedTab: PageTab
    var body: some View {
        HStack(alignment: .bottom){
            
            Spacer()
            
            VStack(spacing: 4) {
                IconsManager.setIcon(icon: .house)
                    .font(.system(size: 24))
                Text("tab-reminder")
                    .setBdoGroteskFont(weight: .medium, size: 10)
            }
            .foregroundColor(selectedTab == .reminders ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .reminders
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                IconsManager.setIcon(icon: .bulletList)
                    .font(.system(size: 24))
                Text("tab-list")
                    .setBdoGroteskFont(weight: .medium, size: 10)
            }
            .foregroundColor(selectedTab == .lists ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .lists
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                IconsManager.setIcon(icon: .dataTabBar)
                    .font(.system(size: 24))
                Text("tab-data")
                    .setBdoGroteskFont(weight: .medium, size: 10)
            }
            .foregroundColor(selectedTab == .data ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .data
            }
            
            Spacer()
        }
        .frame(height: 70)
        .background(Color.preto)
    }
}

struct TabNavigation: View {
    @State var selectedTab: PageTab = .reminders
    
    var pages: [PageTab : AnyView] = [:]
    init() {
        self.pages[PageTab.reminders] = AnyView(ReminderListScreen())
        self.pages[PageTab.lists] = AnyView(ListsScreen())
        self.pages[PageTab.data] = AnyView(Text("Inserir Tela aqui"))
    }
    
    var body: some View {
        VStack(){
            Group {
                pages[selectedTab]
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBarView(selectedTab: $selectedTab)
                
        }
    }
}

#Preview {
    TabNavigation()
}

