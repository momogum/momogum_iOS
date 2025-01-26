//
//  ImageEditPopup.swift
//  momogum
//
//  Created by 류한비 on 1/25/25.
//

import SwiftUI

struct ImageEditPopup: View {
    @Bindable var viewModel: ProfileViewModel
    @Binding var showPopup: Bool
    
    var body: some View {
        VStack {
            // 기본 이미지 사용
            Button {
                viewModel.resetEditingProfileImage() // 기본 이미지로 변경
                showPopup = false
            } label: {
                Text("기본 이미지 사용")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            
            Divider().frame(width: 188.5)
            
            // 갤러리에서 선택
            NavigationLink {
                GalleryProfileView(viewModel: viewModel)
            } label: {
                Text("갤러리에서 선택")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            .simultaneousGesture(TapGesture().onEnded {
                showPopup = false
            })
        }
        .frame(width: 231, height: 146)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
