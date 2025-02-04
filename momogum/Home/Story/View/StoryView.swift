//
//  StoryView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct StoryView: View {
    var userID: String
    @Binding var tabIndex: Int
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능
    
    var body: some View {
        VStack {
            Text("오늘의 한 끼는 어땠나요? 🍽️")
                .font(.mmg(.Header3))
                .bold()
                .padding(.top, 170)
            
            Text("당신의 한 끼를 기록하고, 공유해주세요 :)")
                .font(.mmg(.Body2))
                .padding(.top, 1)
                .padding(.bottom, 92)
            
            HStack {
                Image("no")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
                
                Image("notbad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
                
                Image("yes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
            }
            
            NavigationLink(destination: GalleryPickerView(isTabBarHidden: .constant(false), tabIndex: .constant(1))) {
                Text("바로 밥일기 작성하기")
                    .font(.mmg(.subheader3))
                    .foregroundColor(Color(red: 224/255, green: 90/255, blue: 85/255)) // E05A55 색상
                    .padding()
                    .frame(width: 312, height: 52)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(red: 224/255, green: 90/255, blue: 85/255), lineWidth: 2)
                    )
            }
            .padding(.top, 100)
            
            Spacer() // 아래쪽에 빈 공간 추가
        }
        .frame(maxWidth: .infinity) // VStack의 최대 너비를 설정하여 중앙 정렬
        .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 뒤로가기 동작
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    StoryView(userID: "유저아이디", tabIndex: .constant(0))
}
