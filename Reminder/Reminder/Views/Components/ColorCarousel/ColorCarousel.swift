//
//  ColorPicker.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 31/03/25.
//

import SwiftUI

struct ColorCarousel: View {
    @State private var isColorPickerOpen = false;
    @Binding var selectedColor: Color
    
    let defaultColors: [Color] = [
        .laranja,
        .magenta,
        .verde,
        .amarelo,
        .lilas
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("theme")
                .setBdoGroteskFont(weight: .demibold, size: 18)
                .foregroundStyle(.branco)
            HStack(spacing: 14) {
                ForEach(defaultColors, id: \.self) { color in
                    Button {
                        selectedColor = color
                    } label: {
                        Circle() 
                            .foregroundStyle(color)
                            .overlay {
                                if color == selectedColor {
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
    @Previewable @State var selectedColor: Color = .red
    ColorCarousel(selectedColor: $selectedColor)
}
