//
//  EditProfileView.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: ProfileViewModel
    
    @State private var userName: String = ""
    @State private var userID: String = ""
    @State private var userInfo: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            
            // 프로필 이미지
            PhotosPicker(selection: $viewModel.selectedItem) {
                HStack(alignment: .bottom, spacing: 0) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 88, height: 88)
                            .clipShape(Circle())
                    } else {
                        Image("defaultProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 88, height: 88)
                            .clipShape(Circle())
                    }
                    
                    // 수정 버튼
                    Image("pencil")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(.bottom, 60)
            }
            .onChange(of: viewModel.selectedItem) { oldValue, newValue in
                Task{
                    await viewModel.convertImage(item: newValue)
                }
            }
            
            // 이름 수정
            VStack(alignment: .leading){
                Text("이름")
                    .frame(height: 16)
                    .fontWeight(.semibold)
                
                TextField("이름을 입력하세요", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 298, height: 39)
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 51)
            
            
            // 아이디 수정
            VStack(alignment: .leading){
                Text("사용자 아이디")
                    .frame(height: 16)
                    .fontWeight(.semibold)
                
                TextField("아이디를 입력하세요", text: $userID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 298, height: 39)
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 51)
            
            
            // 한 줄 소개 수정
            VStack(alignment: .leading){
                Text("한 줄 소개")
                    .frame(height: 16)
                    .fontWeight(.semibold)
                
                TextField("소개를 입력하세요", text: $userInfo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 298, height: 39)
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 101)
            
            // 완료버튼
            HStack{
                Spacer()
                Button{
                    print("완료 버튼 클릭")
                    dismiss()
                } label : {
                    Rectangle()
                        .frame(width: 93, height: 41)
                        .foregroundStyle(Color.gray)
                        .overlay(
                            Text("완료")
                                .frame(height: 20)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        )
                }
            }
            .padding(.horizontal, 48)
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("프로필 편집")
                    .frame(height: 20)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            // 뒤로가기 버튼
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.resetEditingProfileImage()
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(.black)
                }
            }
        }
    }
}
