//
//  GeneralCoordinator.swift
//  Reminder
//
//  Created by Carlos Jorge on 04/04/25.
//

import SwiftUI

enum Page: String, Identifiable {
    case main
    case listDetailView
    case createReminderSheet
    case createListSheet
    case configurations
    case editListView
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ContentView()
        case .listDetailView:
            ListDetailsScreen()
        case .createReminderSheet:
            CreateReminderScreen()
        case .createListSheet:
            CreateListScreen()
        case .editListView:
            EditListScreen()
        case .configurations:
            ConfigurationScreen()
        }
    }
}

enum Sheets: String, Identifiable {
    case main
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ReminderCard(title: "Teste", time: "Teste", textTag: "Teste", colorTag: .black, checkColor: .accentColor, action: {})
        }
    }
}

enum FullScreenCover: String, Identifiable {
    case main
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ReminderCard(title: "Teste", time: "Teste", textTag: "Teste", colorTag: .black, checkColor: .accentColor, action: {})
        }
    }
}

protocol CoordinatorProtocol {
    var path: NavigationPath { get set }
}

@Observable
class GeneralCoordinator {
    var path = NavigationPath()
    var sheet: Sheets?
    var fullScreenCover: FullScreenCover?
    
    @MainActor
    var reminderListViewModel = ReminderListViewModel()

    @MainActor func build(page: Page) -> some View {
        return page.view.environment(reminderListViewModel)
    }
    func build(sheet: Sheets) -> some View {
        return sheet.view
    }
    func build(fullScreenCover: FullScreenCover) -> some View {
        return fullScreenCover.view
    }
    
    func present(sheet: Sheets){
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover){
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissSheet(){
        self.sheet = nil
    }
    
    func dismisFullScreenCover(){
        self.fullScreenCover = nil
    }
    
    func navigate(to route: Page) {
        path.append(route)
    }
    
    func navigate(to flow: [Page]) {
        flow.forEach { page in
            path.append(page)
        }
    }
    
    func pop() {
        path.removeLast()
    }
    
    func pop(_ number: Int){
        path.removeLast(number)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
