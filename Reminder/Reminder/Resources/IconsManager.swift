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
    case bulletList = "list.bullet"
    case dataTabBar = "data.tab.bar"
    case clock = "clock"
    case eyedropper = "eyedropper"
    case gift = "gift"
    case book = "book"
    
    case pencilAndOutline = "pencil.and.outline"
    case globe = "globe"
    case paperplane = "paperplane"
    case calendar = "calendar"
    case document = "document"
    case flame = "flame"
    case pencil = "pencil"
    case checkmarkSeal = "checkmark.seal"
    case archiveBox = "archivebox"
    case cloud = "cloud"
    case cloudRain = "cloud.rain"
    case sparkles = "sparkles"
    case playCircle = "play.circle"
    case moon = "moon"
    case sunMin = "sun.min"
    case speakerWave = "speaker.wave.1"
    case suitSpade = "suit.spade"
    case suitClub = "suit.club"
    case flag = "flag"
    case start = "star"
    case bolt = "bolt"
    case ant = "ant"
    case message = "message"
    case phone = "phone"
    case envelope = "envelope"
    case scissors = "scissors"
    case cart = "cart"
    case creditCard = "creditcard"
    case hammer = "hammer"
    case trash = "trash"
    case printer = "printer"
    case squareAndPencil = "square.and.pencil"
    case lock = "lock"
    case mappinAndEllipse = "mappin.and.ellipse"
    case map = "map"
    case car = "car"
    case tram = "tram"
    case hare = "hare"
    case tortoise = "tortoise"
    case film = "film"
    case faceSmiling = "face.smiling"
    case tray = "tray.2"
    case sportscourt = "sportscourt"
    case photo = "photo"
    case cube = "cube"
    case gameController = "gamecontroller"
    case dollarsignSquare = "dollarsign.square"
    case checkmark = "checkmark.circle.fill"
}

let iconsMapper: [(ProjectIcons, Image)] = [
    (.twoPersons, Image(systemName: "person.2")),
    (.bag, Image(systemName: "bag")),
    (.plusCircle, Image(systemName: "plus")),
    (.plusCircleFilled, Image(systemName: "plus.circle.fill")),
    (.house, Image(systemName: "house")),
    (.bulletList, Image(systemName: "list.bullet")),
    (.dataTabBar, Image("data.tab.bar")),
    (.clock, Image(systemName: "clock")),
    (.eyedropper, Image(systemName: "eyedropper")),
    (.gift, Image(systemName: "gift")),
    (.book, Image(systemName: "book")),
    (.pencilAndOutline, Image(systemName: "pencil.and.outline")),
    (.globe, Image(systemName: "globe")),
    (.paperplane, Image(systemName: "paperplane")),
    (.calendar, Image(systemName: "calendar")),
    (.document, Image(systemName: "document")),
    (.flame, Image(systemName: "flame")),
    (.pencil, Image(systemName: "pencil")),
    (.checkmarkSeal, Image(systemName: "checkmark.seal")),
    (.archiveBox, Image(systemName: "archivebox")),
    (.cloud, Image(systemName: "cloud")),
    (.cloudRain, Image(systemName: "cloud.rain")),
    (.sparkles, Image(systemName: "sparkles")),
    (.playCircle, Image(systemName: "play.circle")),
    (.moon, Image(systemName: "moon")),
    (.sunMin, Image(systemName: "sun.min")),
    (.speakerWave, Image(systemName: "speaker.wave.1")),
    (.suitSpade, Image(systemName: "suit.spade")),
    (.suitClub, Image(systemName: "suit.club")),
    (.flag, Image(systemName: "flag")),
    (.start, Image(systemName: "star")),
    (.bolt, Image(systemName: "bolt")),
    (.ant, Image(systemName: "ant")),
    (.message, Image(systemName: "message")),
    (.phone, Image(systemName: "phone")),
    (.envelope, Image(systemName: "envelope")),
    (.scissors, Image(systemName: "scissors")),
    (.cart, Image(systemName: "cart")),
    (.creditCard, Image(systemName: "creditcard")),
    (.hammer, Image(systemName: "hammer")),
    (.trash, Image(systemName: "trash")),
    (.printer, Image(systemName: "printer")),
    (.squareAndPencil, Image(systemName: "square.and.pencil")),
    (.lock, Image(systemName: "lock")),
    (.mappinAndEllipse, Image(systemName: "mappin.and.ellipse")),
    (.map, Image(systemName: "map")),
    (.car, Image(systemName: "car")),
    (.tram, Image(systemName: "tram")),
    (.hare, Image(systemName: "hare")),
    (.tortoise, Image(systemName: "tortoise")),
    (.film, Image(systemName: "film")),
    (.faceSmiling, Image(systemName: "face.smiling")),
    (.tray, Image(systemName: "tray.2")),
    (.sportscourt, Image(systemName: "sportscourt")),
    (.photo, Image(systemName: "photo")),
    (.cube, Image(systemName: "cube")),
    (.gameController, Image(systemName: "gamecontroller")),
    (.dollarsignSquare, Image(systemName: "dollarsign.square")),
    (.checkmark, Image(systemName: "checkmark.circle.fill")),
]

struct IconsManager {
    static func setIcon(icon: ProjectIcons) -> Image {
        guard let iconImage = iconsMapper.first(where: {$0.0 == icon}) else {
            return Image(systemName: "questionmark.app")
        }
        
        return iconImage.1
    }
}
