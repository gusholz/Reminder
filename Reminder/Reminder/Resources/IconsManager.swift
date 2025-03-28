//
//  IconsManager.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 28/03/25.
//

import SwiftUI

enum ProjectIcons: String {
    case twoPersons = "person.2"
    case bag = "bag"
    case plusCircle = "plus.circle"
    case plusCircleFilled = "plus.circle.fill"
    case house = "house"
    case listBullet = "list.bullet"
    case dataTabBar = "data.tab.bar"
    case clock = "clock"
    case eyedropper = "eyedropper"
}

struct IconsManager {
    static func setIcon(icon: ProjectIcons) -> Image {
        return Image(icon.rawValue)
    }
}
