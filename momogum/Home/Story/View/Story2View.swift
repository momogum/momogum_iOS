//
//  Story2View.swift
//  momogum
//
//  Created by 김윤진 on 1/31/25.
//

import SwiftUI

struct Story2View: View {
    var userID: String
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능
    @State private var showReportSheet = false // 신고하기 모달을 표시할 상태 변수
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width:352, height:6)
                .cornerRadius(10)
                .foregroundStyle(.black_3)
                .padding(.top, 8)
            
            HStack {
                Circle()
                    .frame(width:64, height:64)
                    .padding(.leading, 24)
                    .padding(.top, 22)
                    .foregroundColor(Color(red: 207 / 255, green: 207 / 255, blue: 207 / 255))
                VStack {
                    Text("유저아이디")
                        .font(.mmg(.subheader4))
                        .bold()
                        .padding(.top, 22)
                        .padding(.leading, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("식당이름")
                        .font(.mmg(.Caption3))
                        .padding(.leading, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Image("exclamation")
                    .resizable()
                    .frame(width:30, height:30)
                    .padding(.top, 22)
                    .padding(.leading, 8)
                    .onTapGesture {
                        showReportSheet.toggle() // 모달 띄우기
                    }
                
                Button(action: {  // 이미지 클릭 시 홈으로 돌아가기
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("close_s")
                        .resizable()
                        .frame(width:38, height:38)
                        .padding(.top, 22)
                }
                Spacer()
            }
        }
        Rectangle() //게시글 프레임
            .frame(width:360, height: 360)
            .foregroundColor(Color(red: 247 / 255, green: 247 / 255, blue: 247 / 255))
            .padding(.top, 44)
        Spacer()
            .sheet(isPresented: $showReportSheet) {
                ReportView()
                    .presentationDetents([.height(560), .large])
                    .presentationDragIndicator(.visible) 
            }
            .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기

    }
}

#Preview {
    Story2View(userID: "유저아이디")
}
