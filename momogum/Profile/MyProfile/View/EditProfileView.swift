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
    
    // 유저 정보
    @State private var userName: String = ""
    @State private var userID: String = ""
    @State private var userInfo: String = ""
    
    // 팝업창
    @State private var showPopup = false
    @State private var showPhotoPicker = false // PhotosPicker 활성화 여부
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 0){
                HStack(alignment: .center){
                    // back 버튼
                    Button{
                        viewModel.resetEditingProfileImage()
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .frame(width: 24,height: 24)
                    }
                    
                    Spacer().frame(width: 100,height: 24)
                    
                    Text("프로필 편집")
                        .frame(height: 20)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.top, 77)
                .padding(.horizontal, 30)
                
                // 프로필 이미지
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
                        .padding(.bottom, 10)
                }
                .padding(.top, UIScreen.main.bounds.height <= 812 ? 30 : 81)
                .onTapGesture {
                    showPopup = true //클릭 시 팝업 표시
                }
                
                VStack(alignment: .center, spacing: 0) {
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
                    .padding(.bottom, UIScreen.main.bounds.height <= 812 ? 20 : 100)
                }
                .padding(.top, 60)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden()
            .disabled(showPopup)
            
            // 팝업 띄우기
            if showPopup {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showPopup = false // 바깥 영역 터치 시 팝업 비활성화
                    }
                
                ImageEditPopup(viewModel: viewModel, showPopup: $showPopup)
//                    .padding(.bottom, 200)
                    .padding(.bottom, UIScreen.main.bounds.height < 700 ? 200 : 150)
            }
        }
    }
}
