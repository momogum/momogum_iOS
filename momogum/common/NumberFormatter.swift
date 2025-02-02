//
//  NumberFormatter.swift
//  momogum
//
//  Created by 류한비 on 2/3/25.
//

import Foundation

extension Int {
    func formattedFollowerCount() -> String {
        if self < 1_000 {
            return "\(self)" // 0~999
        } else if self < 10_000 {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: self)) ?? "\(self)" // 1,000~9,999는 콤마
        } else {
            return "\(self / 10_000)만" // 10,000 이상은 n만 형식
        }
    }
}
