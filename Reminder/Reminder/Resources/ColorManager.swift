//
//  ColorManager.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 27/03/25.
//

import SwiftUI

enum ProjectColors: String {
    case amarelo
    case laranja
    case lilas
    case magenta
    case verde
    case branco
    case preto
    case backgroundCard
    case cinzaBackground
    case cinzaLabels
    case transparente = "Clear"
}

struct ColorManager {
    static func setColor(_ color: ProjectColors) -> Color {
        return Color(color.rawValue)
    }
}
