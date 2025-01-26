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
                .font(.system(size: 20))
                .foregroundColor(.red)
                .fontWeight(.semibold)
                .padding(.top, 48)
                .padding(.bottom, 29)
            
            Text("삭제된 계정은 다시 복구할 수 없습니다.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .fontWeight(.semibold)
            
            Spacer().frame(width: 300, height: 47)
            
            Divider().frame(width: 269)
            
            Spacer().frame(width: 300, height: 10)
            
            HStack(alignment: .center, spacing: 0){
                // 돌아가기
                Button {
                    showDelPopup = false
                } label: {
                    Text("돌아가기")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 36)
                
                
                VerticalDivider()
                
                // 회원탈퇴
                Button {
                    showDelPopup = false
                } label: {
                    Text("회원탈퇴")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }
                .padding(.leading, 36)
            }
        }
        .frame(width: 310, height: 228)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
