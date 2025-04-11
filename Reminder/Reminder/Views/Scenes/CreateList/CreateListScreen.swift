//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct CreateListScreen: View {
    var body: some View {
        VStack(spacing: 16) {
            TextArea()
            
            Divider()
                .overlay(.cinzaLabels)
            
            ColorCarousel()
            
            Divider()
                .overlay(.cinzaLabels)
            
            IconCarousel()
        }
    }
}

#Preview {
    CreateListScreen()
}
