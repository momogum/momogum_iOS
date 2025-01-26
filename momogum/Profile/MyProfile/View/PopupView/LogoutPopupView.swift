//
//  LogoutPopupView.swift
//  momogum
//
//  Created by 류한비 on 1/26/25.
//

import SwiftUI

struct LogoutPopupView: View {
    @Binding var showLogoutPopup: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // 로그아웃
            Text("지금 로그아웃합니다")
                .frame(height: 20)
                .foregroundColor(.black)
                .fontWeight(.semibold)
            
            Spacer().frame(width: 300, height: 59)
            
            Divider().frame(width: 269)
            
            Spacer().frame(width: 300, height: 20)
            
            HStack(alignment: .center, spacing: 0){
                // 돌아가기
                Button {
                    showLogoutPopup = false
                } label: {
                    Text("돌아가기")
                        .frame(height: 20)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 36)
                
                
                VerticalDivider()
                
                // 로그아웃
                Button {
                    showLogoutPopup = false
                } label: {
                    Text("로그아웃")
                        .frame(height: 20)
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

struct VerticalDivider: View {
    var width: CGFloat = 1
    var height: CGFloat = 37
    
    var body: some View {
        Divider()
            .frame(width: width, height: height)
//            .background(.gray)
    }
}
