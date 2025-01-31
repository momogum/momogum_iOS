//
//  BellView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct BellView: View {
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능
    
    var body: some View {
        VStack{
            HStack {
                Text("읽지않음")
                    .font(.mmg(.subheader4))
                    .foregroundColor(.black)
                    .padding(.leading, 26)
                    .padding(.top, 21)
                Spacer()
                
            }
            .padding(.bottom, 52)
            HStack{
                Text("최근30일")
                    .font(.mmg(.subheader4))
                    .foregroundColor(.black_2)
                    .padding(.leading, 26)
                    .padding(.top, 125)
                Spacer()
                
            }
        }
        Spacer()
        .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 0) { // 쉐브론과 텍스트를 나란히 배치
                    // 쉐브론 아이콘
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                        .frame(width: 143) // 쉐브론과 텍스트 사이 간격
                    
                    // "알림" 텍스트
                    Text("알림")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    BellView()
}
