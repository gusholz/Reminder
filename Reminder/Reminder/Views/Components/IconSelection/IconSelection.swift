//
//  IconSelection.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 03/04/25.
//

import SwiftUI

struct IconSelection: View {
    @State private var selectedIcon: ProjectIcons = .pencilAndOutline
    
    let iconsList: [ProjectIcons] = [
        .pencilAndOutline,
        .globe,
        .paperplane,
        .calendar,
        .document,
        .flame,
        .pencil,
        .checkmarkSeal,
        .archiveBox,
        .cloud,
        .cloudRain,
        .sparkles,
        .playCircle,
        .moon,
        .sunMin,
        .speakerWave,
        .suitClub,
        .suitSpade,
        .flag,
        .start,
        .bolt,
        .ant,
        .message,
        .phone,
        .envelope,
        .scissors,
        .cart,
        .creditCard,
        .hammer,
        .trash,
        .printer,
        .squareAndPencil,
        .lock,
        .mappinAndEllipse,
        .map,
        .car,
        .tram,
        .hare,
        .tortoise,
        .film,
        .faceSmiling,
        .tray,
        .sportscourt,
        .photo,
        .cube,
        .gameController,
        .dollarsignSquare
    ]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("icon")
                .foregroundStyle(.branco)
                .setBdoGroteskFont(weight: .demibold, size: 18)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                ForEach(iconsList, id: \.rawValue) { icon in
                    Button {
                        selectedIcon = icon
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(ColorManager.setColor(.cinzaBackground))
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
                    .padding()
                }
            }
        }
        .padding()
        .background(.preto)
    }
}

#Preview {
    IconSelection()
        .background(.preto)
}
