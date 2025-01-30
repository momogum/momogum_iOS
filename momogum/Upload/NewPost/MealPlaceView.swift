//
//  MealPlaceView.swift
//  momogum
//
//  Created by 조승연 on 1/30/25.
//

import SwiftUI

struct MealPlaceView: View {
    @Binding var mealPlace: String

    private let placeholderColor = Color(hex: 0xCFCFCF)

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Text("어디에서 식사했나요?")
                .font(.headline)
                .foregroundColor(.black)

            TextField("ex. 머머금 식당", text: $mealPlace)
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
    MealPlaceView(mealPlace: .constant(""))
}
