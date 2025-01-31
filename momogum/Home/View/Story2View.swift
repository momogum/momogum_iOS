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
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width:352, height:6)
                .cornerRadius(10)
                .foregroundStyle(.black_3)
                .padding(.top, 8)
            
            HStack{
                VStack{
                    Text("유저아이디")
                        .font(.mmg(.subheader4))
                        .bold()
                        .padding(.top, 22)
                        .padding(.leading, 96)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("식당이름")
                        .font(.mmg(.Caption3))
                        .padding(.leading, 96)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("exclamation")
                    .padding(.leading, 8)
                Image("close_s")
                    .padding(.leading, 1)
                Spacer()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top) // 화면 위쪽으로 정렬
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
    Story2View(userID: "유저아이디")
}
