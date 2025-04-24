//
//  SheetNavBar.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 17/04/25.
//

import SwiftUI

struct SheetNavBar: View {
    @Environment(GeneralCoordinator.self) var coordinator
    var title: String
    var actionTitle: String
    var saveAction: () -> Void
    
    
    var body: some View {
        HStack {
            IconsManager.setIcon(icon: .arrowLeft)
                .frame(width: 54, alignment: .leading)
                .onTapGesture {
                    coordinator.dismissSheet()
                }
            
            Spacer()
            
            Text(title)
                .setBdoGroteskFont(weight: .medium, size: 20)
            
            Spacer()
            
            Text(actionTitle)
                .setSfProDisplayFont(variation: .regular, size: 20)
                .foregroundStyle(.verde)
                .frame(width: 54)
                .onTapGesture {
                    saveAction()
                }
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    SheetNavBar(title: "Novo Lembrete", actionTitle: "Salvar", saveAction: {}).environment(coordinator)
}
