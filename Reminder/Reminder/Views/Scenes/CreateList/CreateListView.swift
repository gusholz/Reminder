//
//  CreateListView.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 11/04/25.
//

import SwiftUI

struct CreateListView: View {
    var body: some View {
        VStack {
            TextArea()
            
            Divider()
            
            ColorCarousel()
            
            IconCarousel()
        }
    }
}

#Preview {
    CreateListView()
}
