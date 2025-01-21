//
//  StoryView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct StoryView: View {
    var userID: String

    var body: some View {
        VStack {
            Text("오늘의 한 끼는 어땠나요?🍽️")
                .font(.title)
                .bold()
                .padding(.top, 218)
            Text("당신의 한 끼를 기록하고, 공유해주세요 :)")
                .padding(.top, 1)
                .padding(.bottom, 92)
            
            HStack {
                Image("smile")
                    .scaledToFit() // 비율 유지
                    .frame(width: 100, height: 100) // 크기 설정
                
                Image("normal")
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Image("sad")
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            // 밥일기 작성 버튼
            NavigationLink(destination: GalleryPickerView(tabIndex: .constant(1))) { 
                Text("바로 밥일기 작성하기")
                    .font(.headline)
                    .foregroundColor(Color(red: 224/255, green: 90/255, blue: 85/255)) // E05A55 색상 적용 (RGB로 변환)
                    .padding()
                    .frame(width: 312, height: 52)
                    .background(Color.clear) // 배경 투명
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 224/255, green: 90/255, blue: 85/255), lineWidth: 2) // 테두리 색상
                    )
            }
            .padding(.top, 114) // 이미지 밑에서 114만큼 떨어지도록 설정
            
            Spacer()
        }
        .navigationBarTitle("\(userID)", displayMode: .inline)
    }
}

#Preview {
    StoryView(userID: "유저아이디") // 예시로 유저 아이디를 넣어줍니다.
}

