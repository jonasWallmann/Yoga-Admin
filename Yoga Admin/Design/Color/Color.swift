//
//  Color.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 16.02.24.
//

import SwiftUI

//extension Color {
//    static private let hue: Double = 229 / 360
//
//    static private let accentLight = Color(hue: hue, saturation: 0.64, brightness: 0.78)
//    static private let accentDark = Color(hue: hue, saturation: 0.64, brightness: 0.9)
//
//    static private let darkestLight = Color(hue: hue, saturation: 0.55, brightness: 0.19)
//    static private let darkestDark = Color(hue: hue, saturation: 0.05, brightness: 1)
//
//    static private let darkLight = Color(hue: hue, saturation: 0.27, brightness: 0.44)
//    static private let darkDark = Color(hue: hue, saturation: 0.05, brightness: 0.75)
//
//    static private let mediumLight = Color(hue: hue, saturation: 0.18, brightness: 0.68)
//    static private let mediumDark = Color(hue: hue, saturation: 0.18, brightness: 0.25)
//
//    static private let lightLight = Color(hue: hue, saturation: 0.1, brightness: 0.95)
//    static private let lightDark = Color(hue: hue, saturation: 0.1, brightness: 0.1)
//
//    static private let lightestLight = Color(hue: hue, saturation: 0.02, brightness: 0.98)
//    static private let lightestDark = Color(hue: hue, saturation: 0.01, brightness: 0.07)
//
//    static private let whiteLight = Color(hue: 0, saturation: 0, brightness: 1)
//    static private let whiteDark = Color(hue: hue, saturation: 0.02, brightness: 0.13)
//
//    static private let sidebarLight = Color(hue: 0.3, saturation: 0.01, brightness: 0.89)
//    static private let sidebarDark = Color(hue: 0.3, saturation: 0.01, brightness: 0.16)
//
//    static func accent(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? accentLight : accentDark
//    }
//
//    static func darkest(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? darkestLight : darkestDark
//    }
//
//    static func dark(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? darkLight : darkDark
//    }
//
//    static func medium(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? mediumLight : mediumDark
//    }
//
//    static func light(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? lightLight : lightDark
//    }
//
//    static func lightest(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? lightestLight : lightestDark
//    }
//
//    static func white(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? whiteLight : whiteDark
//    }
//
//    static func sidebar(_ scheme: ColorScheme) -> Color {
//        scheme == .light ? sidebarLight : sidebarDark
//    }
//}
//

//}

enum ColorEnum: String, Codable, CaseIterable, Identifiable {
    case red = "Red"
    case orange = "Orange"
    case yellow = "Yellow"
    case green = "Green"
    case teal = "Teal"
    case blue = "Blue"
    case indigo = "Indigo"
    case purple = "Purble"
    case brown = "brown"
    
    var id: Self {
        return self
    }
    
    var value: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .teal:
            return .teal
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        case .brown:
            return .brown
        }
    }
    
}

extension Color {



    static let redPaleLight = Color(hue: 6 / 360, saturation: 0.2, brightness: 0.94)
    static let orangePaleLight = Color(hue: 29 / 360, saturation: 0.2, brightness: 0.96)
    static let yellowPaleLight = Color(hue: 43 / 360, saturation: 0.2, brightness: 0.98)
    static let greenPaleLight = Color(hue: 118 / 360, saturation: 0.2, brightness: 0.85)
    static let tealPaleLight = Color(hue: 195 / 360, saturation: 0.2, brightness: 0.85)
    static let bluePaleLight = Color(hue: 215 / 360, saturation: 0.2, brightness: 0.96)
    static let indigoPaleLight = Color(hue: 237 / 360, saturation: 0.2, brightness: 0.78)
    static let purplePaleLight = Color(hue: 274 / 360, saturation: 0.2, brightness: 0.82)
    static let brownPaleLight = Color(hue: 32 / 360, saturation: 0.2, brightness: 0.7)

    static let redPaleDark = Color(hue: 6 / 360, saturation: 0.5, brightness: 0.3)
    static let orangePaleDark = Color(hue: 29 / 360, saturation: 0.5, brightness: 0.3)
    static let yellowPaleDark = Color(hue: 43 / 360, saturation: 0.5, brightness: 0.3)
    static let greenPaleDark = Color(hue: 118 / 360, saturation: 0.5, brightness: 0.3)
    static let tealPaleDark = Color(hue: 195 / 360, saturation: 0.5, brightness: 0.3)
    static let bluePaleDark = Color(hue: 215 / 360, saturation: 0.5, brightness: 0.3)
    static let indigoPaleDark = Color(hue: 237 / 360, saturation: 0.5, brightness: 0.3)
    static let purplePaleDark = Color(hue: 274 / 360, saturation: 0.5, brightness: 0.3)
    static let brownPaleDark = Color(hue: 32 / 360, saturation: 0.5, brightness: 0.3)


    static func redPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? redPaleLight : redPaleDark
    }

    static func orangePale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? orangePaleLight : orangePaleDark
    }

    static func yellowPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? yellowPaleLight : yellowPaleDark
    }

    static func greenPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? greenPaleLight : greenPaleDark
    }

    static func tealLight(_ scheme: ColorScheme) -> Color {
        scheme == .light ? tealPaleLight : tealPaleDark
    }

    static func tealPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? tealPaleLight : tealPaleDark
    }
    static func bluePale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? bluePaleLight : bluePaleDark
    }
    static func indigoPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? indigoPaleLight : indigoPaleDark
    }
    static func purplePale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? purplePaleLight : purplePaleDark
    }
    static func brownPale(_ scheme: ColorScheme) -> Color {
        scheme == .light ? brownPaleLight : brownPaleDark
    }

    static func paleFor(color: ColorEnum, scheme: ColorScheme) -> Color {
        switch color {
        case .red:
            return redPale(scheme)
        case .orange:
            return orangePale(scheme)
        case .yellow:
            return yellowPale(scheme)
        case .green:
            return greenPale(scheme)
        case .teal:
            return tealPale(scheme)
        case .blue:
            return bluePale(scheme)
        case .indigo:
            return indigoPale(scheme)
        case .purple:
            return purplePale(scheme)
        case .brown:
            return brownPale(scheme)
        }
    }
}

//#Preview("Test Color") {
//    Color.accent
//}
