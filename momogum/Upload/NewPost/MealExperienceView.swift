//
//  MealExperienceView.swift
//  momogum
//
//  Created by 조승연 on 1/30/25.
//

import SwiftUI

struct MealExperienceView: View {
    @Binding var newExperience: String

    private let placeholderColor = Color(hex: 0xCFCFCF)

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Text("식사 경험을 간단히 알려주세요!")
                .font(.headline)
                .foregroundColor(.black)

            TextField("ex. 맛있었다.", text: $newExperience)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(20)
                .frame(width: 353, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(placeholderColor.opacity(0.2))
                            )
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MealExperienceView(newExperience: .constant(""))
}
