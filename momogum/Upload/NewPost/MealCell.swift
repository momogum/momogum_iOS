//
//  CategoryCell.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import SwiftUI

struct MealCell: View {
    let category: String
    let isSelected: Bool

    var body: some View {
        Text(category)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(isSelected ? .white : .black)
            .frame(width: 60, height: 32)
            .background(isSelected ? Color.momogumRed : Color.placeholderGray3)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.borderGray, lineWidth: 1)
            )
    }
}

#Preview {
    MealCell(category: "한식", isSelected: true)
}
