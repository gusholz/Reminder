//
//  ColorConverter.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 09/04/25.
//

import SwiftUI

extension String {
    func toColor() -> Color {
        return Color(uiColor: UIColor(named: self) ?? UIColor(.white))
    }
    
    func extractColorFromNamedColor() -> Color? {
        let prefix = "NamedColor(name: \""
        
        guard let prefixRange = self.range(of: prefix) else {
            return nil
        }

        let afterPrefix = self[prefixRange.upperBound...]

        guard let endQuoteIndex = afterPrefix.firstIndex(of: "\"") else {
            return nil
        }

        let colorName = afterPrefix[..<endQuoteIndex]
        return Color(UIColor(named: String(colorName)) ?? .white)
    }
    
    func extractRGBColor() -> Color? {
        let components = self
            .replacingOccurrences(of: "kCGColorSpaceModelRGB", with: "")
            .trimmingCharacters(in: .whitespaces)
            .split(separator: " ")
            .compactMap { Double($0) }

        guard components.count == 4 else {
            return nil
        }

        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]

        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension Color {
    func toString() -> String {
        return self.description
    }
}
