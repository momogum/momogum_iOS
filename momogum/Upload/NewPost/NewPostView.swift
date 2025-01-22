//
//  NewPostView.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import SwiftUI

struct NewPostView: View, Hashable {
    @Environment(\.dismiss) var dismiss
    let editedImage: UIImage
    let onReset: () -> Void

    static func == (lhs: NewPostView, rhs: NewPostView) -> Bool {
        lhs.editedImage.pngData() == rhs.editedImage.pngData()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(editedImage.pngData())
    }

    @State private var selectedCategory: String? = nil
    @State private var tags: [String] = [] // 태그를 관리할 State 변수

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(alignment: .center, spacing: 0) {
                // 상단 네비게이션 바
                HStack {
                    Button(action: {
                        onReset()
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .frame(width: 44, height: 44)

                    Spacer()

                    Text("새 게시물")
                        .font(.headline)
                        .foregroundColor(.black)

                    Spacer()

                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)
                .frame(height: 60)

                // 사진 뷰
                GeometryReader { geometry in
                    Image(uiImage: editedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.width / editedImage.size.width * editedImage.size.height)
                        .clipped()
                }
                .frame(height: UIScreen.main.bounds.width / editedImage.size.width * editedImage.size.height)
                .padding(.bottom, 30)

                // 카테고리 선택
                MealCategoryView(
                    categories: ["한식", "중식", "일식", "양식", "아시안", "패스트푸드", "카페", "기타"],
                    selectedCategory: $selectedCategory
                )

                // 식사 메뉴 입력 (카테고리 선택 시만 표시)
                if selectedCategory != nil {
                    MealInputView(tags: $tags)
                        .padding(.top, 20)
                        .transition(.opacity) // 부드러운 전환 효과
                        .animation(.easeInOut, value: selectedCategory)
                }

                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        NewPostView(
            editedImage: UIImage(systemName: "photo") ?? UIImage(),
            onReset: {} // 테스트용 빈 클로저 전달
        )
    }
}
