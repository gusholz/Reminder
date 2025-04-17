//
//  ContentView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 15/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabNavigation()
        }
        .padding()
    }
}

#Preview {
    @Previewable var coordinator = GeneralCoordinator()
    ContentView().environment(coordinator)
}
