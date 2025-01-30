//
//  DelAccPopupView.swift
//  momogum
//
//  Created by 류한비 on 1/26/25.
//

import SwiftUI

struct DelAccPopupView: View {
    @Binding var showDelPopup: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Text("정말 탈퇴하시겠습니까?")
                .font(.mmg(.subheader3))
                .foregroundColor(Color.red)
                .padding(.top, 43)
                .padding(.bottom, 24)
            
            Text("삭제된 계정은 다시 복구할 수 없습니다.")
                .font(.mmg(.subheader4))
                .foregroundColor(Color.black_2)
            
            Spacer().frame(width: 300, height: 39)
            
            Divider().frame(width: 252)
            
            Spacer().frame(width: 300, height: 10)
            
            HStack(alignment: .center, spacing: 0){
                // 돌아가기
                Button {
                    showDelPopup = false
                } label: {
                    Text("돌아가기")
                        .font(.mmg(.subheader3))
                        .foregroundColor(Color.black_2)
                }
                .padding(.trailing, 36)
                
                
                VerticalDivider()
                
                // 회원탈퇴
                Button {
                    showDelPopup = false
                } label: {
                    Text("회원탈퇴")
                        .font(.mmg(.subheader3))
                        .foregroundColor(Color.red)
                }
                .padding(.leading, 36)
            }
        }
        .frame(width: 304, height: 222)
        .background(Color.black_6)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black_4, lineWidth: 1)
        )
    }
}
