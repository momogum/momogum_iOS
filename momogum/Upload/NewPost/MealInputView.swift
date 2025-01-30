//
//  MealInputView.swift
//  momogum
//
//  Created by 조승연 on 1/23/25.
//

import SwiftUI

struct MealInputView: View {
    @Binding var tags: [String]
    @State private var newTag: String = ""

    private let maxTags = 5
    private let inputBackgroundColor = Color(hex: 0xCFCFCF)
    private let tagColor = Color(hex: 0xE05A55)
    private let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(.flexible(), alignment: .leading)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Text("식사메뉴를 알려주세요")
                .font(.headline)
                .foregroundColor(.black)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                if tags.count < maxTags {
                    TextField("# 식사메뉴 입력", text: $newTag)
                        .foregroundColor(.black)
                        .onSubmit {
                            addTag()
                        }
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                        .padding(.vertical, 14)
                        .padding(.leading, 12)
                        .frame(width: 129, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(inputBackgroundColor)
                        )
                        .animation(.easeInOut, value: newTag)
                }

                ForEach(tags, id: \.self) { tag in
                    HStack(spacing: 2) {
                        Text("# \(tag)")
                            .foregroundColor(.white)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 12)
                        Button(action: {
                            tags.removeAll { $0 == tag }
                        }) {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(.trailing, 8)
                        }
                    }
                    .background(tagColor)
                    .cornerRadius(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .animation(.easeInOut, value: tags)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .animation(.easeInOut, value: tags)
    }

    private func addTag() {
        let trimmedTag = newTag.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedTag.isEmpty, tags.count < maxTags, !tags.contains(trimmedTag) {
            tags.append(trimmedTag)
        }
        newTag = ""
    }
}

#Preview {
    struct MealInputPreviewWrapper: View {
        @State private var tags: [String] = []

        var body: some View {
            MealInputView(tags: $tags)
        }
    }

    return MealInputPreviewWrapper()
}
