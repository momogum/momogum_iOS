//
//  Color.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}


extension ShapeStyle where Self == Color {
  
    static var momogumRed : Color {
        Color(hex: 0xE05A55)
    }
    static var placeholderGray : Color {
        Color(hex : 0xA2A2A2)
    }
    static var borderGray : Color {
        Color(hex : 0xF3F3F3)
    }
    static var signupDescriptionGray : Color {
        Color(hex: 0x707070)
    }
    
    static var placeholderGray2 : Color {
        Color(hex: 0xD9D9D9)
    }
    static var placeholderGray3 : Color {
        Color(hex: 0xF3F3F3)
    }
}
