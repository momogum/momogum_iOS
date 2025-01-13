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
}
