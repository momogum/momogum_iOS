//
//  DonePostView.swift
//  momogum
//
//  Created by 조승연 on 1/30/25.
//

import SwiftUI

struct DonePostView: View {
    @Environment(\.dismiss) var dismiss
    let uploadedImage: UIImage

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.title2)
                }
                .frame(width: 44, height: 44)
                .padding(.leading, 16)

                Spacer()
            }
            .frame(height: 60)

            Spacer().frame(height: 90)

            Text("오늘의 밥일기 업로드 완료!")
                .font(.system(size: 24))

            Spacer().frame(height: 80)

            Image(uiImage: uploadedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 211, height: 211)
                .clipped()

            Spacer().frame(height: 90)

            NavigationLink(destination: MyCardView()) {
                Text("바로 확인하기")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 340, height: 58)
                    .foregroundColor(Color(hex: 0xE05A55))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color(hex: 0xE05A55), lineWidth: 2)
                    )
            }
            .padding(.bottom, 40)

            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DonePostView(uploadedImage: UIImage(systemName: "photo") ?? UIImage())
}
