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
            .font(.subheadline)
            .foregroundColor(isSelected ? .white : .black)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(isSelected ? Color.momogumRed : Color.placeholderGray3)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.borderGray, lineWidth: 1)
            )
    }
}

#Preview {
    MealCell(category: "한식", isSelected: true)
}
