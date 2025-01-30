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
                .font(.mmg(.subheader3))
                .foregroundColor(Color.black_1)
                .padding(.top, 58)
            
            Spacer().frame(width: 300, height: 54)
            
            Divider().frame(width: 252)
            
            Spacer().frame(width: 300, height: 8)
            
            HStack(alignment: .center, spacing: 0){
                // 돌아가기
                Button {
                    showLogoutPopup = false
                } label: {
                    Text("돌아가기")
                        .font(.mmg(.subheader3))
                        .foregroundColor(Color.black_2)
                }
                .padding(.trailing, 36)
                
                
                VerticalDivider()
                
                // 로그아웃
                Button {
                    showLogoutPopup = false
                } label: {
                    Text("로그아웃")
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

struct VerticalDivider: View {
    var width: CGFloat = 1
    var height: CGFloat = 37
    
    var body: some View {
        Divider()
            .frame(width: width, height: height)
    }
}
