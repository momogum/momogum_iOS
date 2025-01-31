//
//  CategorySelectionView.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import SwiftUI

struct MealCategoryView: View {
    let categories: [String]
    @Binding var selectedCategory: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("식사 카테고리 선택")
                .font(.headline)
                .padding(.leading, 16)

            Spacer().frame(height: 28)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        MealCell(
                            category: category,
                            isSelected: selectedCategory == category
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    MealCategoryView(
        categories: ["한식", "중식", "일식", "양식", "아시안", "패스트푸드", "카페", "기타"],
        selectedCategory: .constant(nil)
    )
}
