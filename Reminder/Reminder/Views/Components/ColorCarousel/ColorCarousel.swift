//
//  ColorPicker.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 31/03/25.
//

import SwiftUI

struct ColorCarousel: View {
    @State private var isColorPickerOpen = false;
    @State private var selectedColor: Color = ColorManager.setColor(.transparente);
    
    let defaultColors: [ProjectColors] = [
        ProjectColors.laranja,
        ProjectColors.magenta,
        ProjectColors.verde,
        ProjectColors.amarelo,
        ProjectColors.lilas
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("theme")
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .foregroundStyle(ColorManager.setColor(.branco))
            HStack(spacing: 14) {
                ForEach(defaultColors, id: \.rawValue) { color in
                    Button {
                        selectedColor = ColorManager.setColor(color)
                    } label: {
                        Circle() 
                            .foregroundStyle(ColorManager.setColor(color))
                            .overlay {
                                if ColorManager.setColor(color) == selectedColor {
                                    CircleOutline()
                                }
                            }
                    }
                }
                
                ColorPicker("", selection: $selectedColor)
                    .scaleEffect(2)
                    .frame(width: 50, height: 50)
                    .labelsHidden()
            }
        }
        .padding()
    }
}

#Preview {
    ColorCarousel()
        .background(ColorManager.setColor(.preto))
}
