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
//    @State private var showLogoutPopup = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                // 로그아웃
                Button {
                    showLogoutPopup = true
                    showPopup = false
                } label: {
                    Text("로그아웃")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
                
                Divider().frame(width: 152)
                
                // 회원탈퇴
                Button {
                    showPopup = false
                } label: {
                    Text("회원탈퇴")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }
            }
            .frame(width: 201, height: 115)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            // 로그아웃 팝업 띄우기
//            if showLogoutPopup{
//                Color.red.opacity(0.1)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        showLogoutPopup = false
//                    }
//                LogoutPopupView(showLogoutPopup: $showLogoutPopup)
//                    .zIndex(1)
//            }
        }
    }
}
