//
//  EditImageView.swift
//  momogum
//
//  Created by 류한비 on 1/30/25.
//

import SwiftUI

struct EditImageView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing : 0){
            HStack(spacing : 0){
                // back 버튼
                Button{
                    dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                .padding(.trailing, 281)
                
                
                // cancle 버튼
                Button{
                    dismiss()
                } label: {
                    Image("close")
                        .resizable()
                        .frame(width: 20,height: 20)
                }
            }
            .padding(.top, 68)
            .padding(.horizontal, 32)
            .padding(.bottom, 136)
            
            if let uiImage = viewModel.currentPreviewImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 394, height: 394)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.Red_2)
                            .frame(width: 360, height: 360)
                    )
            } else {
                Text("이미지를 불러올 수 없습니다.")
            }
            HStack{
                Spacer()
                Button{
                    dismiss()
                } label: {
                    Rectangle()
                        .frame(width: 105, height: 52)
                        .foregroundStyle(Color.Red_2)
                        .cornerRadius(12)
                        .overlay(
                            Text("다음")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        )
                }
            }
            .padding(.top, 130)
            .padding(.trailing, 29)
            .padding(.bottom, 63)
            
        }
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    EditImageView(viewModel: ProfileViewModel())
}
