//
//  ImageEditorView.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

struct ImageEditorView: View {
    var image: UIImage
    @Binding var tabIndex: Int // 탭 인덱스를 바인딩으로 받아서 TabView를 전환
    @Environment(\.presentationMode) var presentationMode // 뒤로 가기 기능을 위한 환경 변수

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                // Custom Header
                HStack {
                    // Back Button
                    Button(action: {
                        tabIndex = 1 // 업로드 탭으로 이동
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }

                    Spacer()

                    // Close Button
                    Button(action: {
                        tabIndex = 0 // 홈 탭으로 이동
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                }
                .padding(.horizontal, 16)
                .frame(height: 60)
                .background(Color.white)

                Spacer()
            }
            .zIndex(1)

            // Main content: Selected image
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Spacer()
            }
            .zIndex(0)
        }
        .navigationBarHidden(true) // 네비게이션 바 숨김
    }
}

#Preview {
    ImageEditorView(image: UIImage(systemName: "photo")!, tabIndex: .constant(1)) 
}
