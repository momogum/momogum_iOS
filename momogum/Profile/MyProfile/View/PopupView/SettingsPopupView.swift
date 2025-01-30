//
//  SettingsPopupView.swift
//  momogum
//
//  Created by 류한비 on 1/25/25.
//

import SwiftUI

struct SettingsPopupView: View {
    @Binding var showPopup: Bool
    @Binding var showLogoutPopup: Bool
    @Binding var showDelPopup: Bool
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                // 로그아웃
                Button {
                    showLogoutPopup = true
                    showPopup = false
                } label: {
                    Text("로그아웃")
                        .font(.mmg(.subheader4))
                        .foregroundColor(Color.black_2)
                }
                .padding(.bottom, 15)
                
                Divider().frame(width: 132)
                
                // 회원탈퇴
                Button {
                    showDelPopup = true
                    showPopup = false
                } label: {
                    Text("회원탈퇴")
                        .font(.mmg(.subheader4))
                        .foregroundColor(Color.red)
                }
                .padding(.top, 15)
            }
            .frame(width: 159, height: 104)
            .background(Color.black_6)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black_4, lineWidth: 1)
            )
        }
    }
}
