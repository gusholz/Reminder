//
//  GeneralCoordinator.swift
//  Reminder
//
//  Created by Carlos Jorge on 04/04/25.
//

import SwiftUI

enum Page: String, Identifiable {
    case main
        var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ContentView()
        }
    }
}

enum Sheets: String, Identifiable {
    case main
    case selectedDaysSheet
    case selectListSheet
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            ReminderCard(isChecked: .constant(false), title: "Teste", time: "Teste", textTag: "Teste", colorTag: .black, checkColor: .accentColor)
        case .selectedDaysSheet:
            DaySelection()
        case .selectListSheet:
            ListsScreen()
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
            ReminderCard(isChecked: .constant(false), title: "Teste", time: "Teste", textTag: "Teste", colorTag: .black, checkColor: .accentColor)
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

    func build(page: Page) -> some View {
        return page.view
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
