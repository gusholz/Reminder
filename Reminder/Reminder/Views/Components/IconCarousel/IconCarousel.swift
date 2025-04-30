//
//  IconCarousel.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 02/04/25.
//

import SwiftUI

struct IconCarousel: View {
    @Binding var selectedIcon: ProjectIcons
    @State private var isSheetOpen: Bool = false
    
    let defaultIcons: [ProjectIcons] = [
        .bulletList,
        .twoPersons,
        .bag,
        .gift,
        .book,
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("icon")
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .foregroundStyle(.branco)
            HStack {
                ForEach(defaultIcons, id: \.rawValue) { icon in
                    Button {
                        selectedIcon = icon
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.cinzaBackground)
                                .scaleEffect(0.9)
                            IconsManager.setIcon(icon: icon)
                                .scaleEffect(1.4)
                                .foregroundStyle(.white)
                                .overlay {
                                    if selectedIcon == icon {
                                        CircleOutline()
                                    }
                                }
                        }
                    }
                }
                
                Button {
                    isSheetOpen.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.branco)
                            .scaleEffect(0.9)
                        IconsManager.setIcon(icon: .plusCircle)
                            .scaleEffect(1.4)
                            .foregroundStyle(.preto)
                            .overlay {
                                if !defaultIcons.contains(selectedIcon) {
                                    CircleOutline()
                                }
                            }
                    }
                }
                .sheet(isPresented: $isSheetOpen) {
                    IconSelection(selectedIcon: $selectedIcon)
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var icon: ProjectIcons = .ant
    IconCarousel(selectedIcon: $icon)
}
