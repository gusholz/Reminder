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
            
            Spacer().frame(width: 28)
            
            VStack{
                IconsManager.setIcon(icon: .house).padding(.bottom, 2)
                Text("tab-reminder")
            }
            .foregroundColor(selectedTab == .reminders ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .reminders
            }
            .fontWeight(.bold)
            
            Spacer()
            
            VStack{
                IconsManager.setIcon(icon: .bulletList).padding(.bottom, 2).font(.system(size: 24))
                Text("tab-list")
            }
            .foregroundColor(selectedTab == .lists ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .lists
            }
            .fontWeight(.bold)
            
            Spacer()
            
            VStack{
                IconsManager.setIcon(icon: .dataTabBar).padding(.bottom, 2)
                Text("tab-data")
            }
            .foregroundColor(selectedTab == .data ? Color.verde : Color.branco)
            .onTapGesture {
                selectedTab = .data
            }
            .fontWeight(.bold)
            
            Spacer().frame(width: 28)
        }
        .frame(height: 70)
        .background(Color.preto)
    }
}

struct TabNavigation: View {
    @State var selectedTab: PageTab = .reminders
    
    var pages: [PageTab : AnyView] = [:]
    init() {
        self.pages[PageTab.reminders] = AnyView(Text("Inserir Tela aqui"))
        self.pages[PageTab.lists] = AnyView(Text("Inserir Tela aqui"))
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

