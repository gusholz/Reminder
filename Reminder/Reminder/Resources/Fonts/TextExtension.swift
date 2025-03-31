//
//  TextExtension.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 27/03/25.
//

import SwiftUI

enum BdoFontWeight: String {
    case light = "BDOGrotesk-Light"
    case regular = "BDOGrotesk-Regular"
    case medium = "BDOGrotesk-Medium"
    case bold = "BDOGrotesk-Bold"
    case extraBold = "BDOGrotesk-ExtraBold"
    case demibold = "BDOGrotesk-DemiBold"
    case black = "BDOGrotesk-Black"
}

enum SfProDisplayFontVariations : String {
    case black = "SFProDisplay-Black"
    case blackItalic = "SFProDisplay-BlackItalic"
    case bold = "SFProDisplay-Bold"
    case boldItalic = "SFProDisplay-BoldItalic"
    case heavy = "SFProDisplay-Heavy"
    case heavyItalic = "SFProDisplay-HeavyItalic"
    case light = "SFProDisplay-Light"
    case lightItalic = "SFProDisplay-LightItalic"
    case medium = "SFProDisplay-Medium"
    case mediumItalic = "SFProDisplay-MediumItalic"
    case regular = "SFProDisplay-Regular"
    case regularItalic = "SFProDisplay-RegularItalic"
    case thin = "SFProDisplay-Thin"
    case thinItalic = "SFProDisplay-ThinItalic"
    case ultralight = "SFProDisplay-Ultralight"
    case ultralightItalic = "SFProDisplay-UltralightItalic"
}

extension Text {
    func setBdoGroteskFont(weight: BdoFontWeight, size: CGFloat) -> Text {
        return self.font(.custom(weight.rawValue, size: size))
    }
    
    func setSfProDisplayFont(variation: SfProDisplayFontVariations, size: CGFloat) -> Text {
        return self.font(.custom(variation.rawValue, size: size))
    }
}

extension Font {
    func setBdoGroteskFont(weight: BdoFontWeight ,size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
    
    func setSfProDisplayFont(variation: SfProDisplayFontVariations, size: CGFloat) -> Font {
        return .custom(variation.rawValue, size: size)
    }
}
