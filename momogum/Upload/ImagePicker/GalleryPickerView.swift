//
//  GalleryPickerView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct GalleryPickerView: View {
    @Binding var tabIndex: Int
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능

    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 뒤로가기 동작
                }) {
                    Image(systemName: "chevron.left") // 쉐브론 아이콘
                        .foregroundColor(.black) // 색상 설정
                }
            }
        }
    }
}

#Preview {
    GalleryPickerView(tabIndex: .constant(1))
}

