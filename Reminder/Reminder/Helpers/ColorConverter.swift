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
}
