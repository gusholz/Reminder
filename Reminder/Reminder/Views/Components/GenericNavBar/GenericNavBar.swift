//
//  SheetNavBar.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 17/04/25.
//

import SwiftUI

struct GenericNavBar: View {
    @Environment(GeneralCoordinator.self) var coordinator
    var title: LocalizedStringKey
    var actionTitle: LocalizedStringKey
    var saveAction: () -> Void
    var dismissAction: () -> Void
    var hasSaveAction: Bool = true
    
    var body: some View {
        HStack {
            IconsManager.setIcon(icon: .arrowLeft)
                .frame(width: 54, alignment: .leading)
                .onTapGesture {
                    dismissAction()
                }
            
            Spacer()
            
            Text(title)
                .setBdoGroteskFont(weight: .medium, size: 20)
            
            Spacer()
            
            if hasSaveAction {
                Text(actionTitle)
                    .setSfProDisplayFont(variation: .regular, size: 20)
                    .foregroundStyle(.verde)
                    .frame(width: 54)
                    .onTapGesture {
                        saveAction()
                    }
            } else {
                Color.clear.frame(width: 54, height: 0)
            }
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    GenericNavBar(title: "Novo Lembrete", actionTitle: "Salvar", saveAction: {}, dismissAction: {}).environment(coordinator)
}
