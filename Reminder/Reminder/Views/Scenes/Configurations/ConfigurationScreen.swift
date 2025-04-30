//
//  ConfigurationScreen.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 28/04/25.
//

import SwiftUI

struct ConfigurationScreen: View {
    // TODO: Create ViewModel
    @State private var isWidgetEnabled: Bool = false
    @Environment(GeneralCoordinator.self) var coordinator
    
    var body: some View {
        VStack {
            
            GenericNavBar(title: "configurations", actionTitle: "save") {
                
            } dismissAction: {
                coordinator.pop()
            }
            .padding(.horizontal)
            List {
                Section(header: Text("date_and_hour")) {
                    Menu {
                        Button {
                            
                        } label: {
                            Text("12_hrs")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("24_rs")
                        }
                        
                    } label: {
                        ListRow(title: "hour_format", label: "12_hrs")
                    }
                    
                    Menu {
                        Button {
                            
                        } label: {
                            Text("dd_mm_yy")
                        }
                        
                        Button {
                            
                        } label: {
                            Text("mm_dd_yy")
                        }
                        
                    } label: {
                        ListRow(title: "date_format", label: "dd_mm_yy")
                    }
                }
                
                Section(header: Text("personalize")) {
                    Toggle("widget", isOn: $isWidgetEnabled)
                    ListRow(title: "theme", label: "")
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ListRow: View {
    var title: LocalizedStringKey
    var label: LocalizedStringKey
    
    var body: some View {
        HStack {
            Text(title)
                .setBdoGroteskFont(weight: .medium, size: 15)
                .foregroundStyle(.branco)
            
            Spacer()
            
            Text(label)
                .setBdoGroteskFont(weight: .medium, size: 14)
                .foregroundStyle(.cinzaLabels)
            
            IconsManager.setIcon(icon: .arrowRight)
                .foregroundStyle(.cinzaLabels)
        }
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    NavigationStack {
        ConfigurationScreen().environment(coordinator)
    }
}
