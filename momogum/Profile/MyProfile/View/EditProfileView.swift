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
    
    // 팝업창
    @State private var showPopup = false
    @State private var showGalleryProfile = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .center, spacing: 0){
                    HStack(alignment: .center){
                        // back 버튼
                        Button{
                            viewModel.resetUserData() // 임시 이미지 초기화
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
                        if let profileImage = viewModel.currentPreviewImage {
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 88, height: 88)
                                .clipShape(Circle())
                                .padding(3)
                                .overlay(
                                    Circle()
                                        .stroke(lineWidth: 4)
                                        .foregroundStyle(Color.black_4)
                                )
                        } else {
                            Image("defaultProfile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 88, height: 88)
                                .clipShape(Circle())
                                .padding(3)
                                .overlay(
                                    Circle()
                                        .stroke(lineWidth: 4)
                                        .foregroundStyle(Color.black_4)
                                )
                        }
                        
                        // 수정 버튼
                        Image("pencil")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .padding(.bottom, 5)
                    }
                    .padding(.top, UIScreen.main.bounds.height <= 812 ? 30 : 81)
                    .onTapGesture {
                        if viewModel.isDefaultProfileImage {
                            // 기본 프로필일 경우 네비게이션 이동
                            showGalleryProfile = true
                        } else {
                            // 아닐 경우 팝업 표시
                            showPopup = true
                        }
                    }
                    
                    VStack(alignment: .center, spacing: 0) {
                        // 이름 수정
                        VStack(alignment: .leading){
                            Text("이름")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            TextField("이름을 입력하세요", text: $viewModel.draftUserName)
                                .frame(width: 328, height: 39)
                            
                            Rectangle()
                                .frame(width: 328, height: 1)
                                .foregroundStyle(.black_4)
                        }
                        .padding(.horizontal, 47)
                        .padding(.bottom, 40)
                        
                        
                        // 아이디 수정
                        VStack(alignment: .leading){
                            Text("사용자 아이디")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            TextField("아이디를 입력하세요", text: $viewModel.draftUserID)
                                .frame(width: 328, height: 39)
                            
                            Rectangle()
                                .frame(width: 328, height: 1)
                                .foregroundStyle(.black_4)
                        }
                        .padding(.horizontal, 47)
                        .padding(.bottom, 40)
                        
                        
                        // 한 줄 소개 수정
                        VStack(alignment: .leading){
                            Text("한 줄 소개")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .padding(.bottom, 31)
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.black_5)
                                    .frame(width: 320, height: 126)
                                
                                TextEditor(text: $viewModel.draftUserBio)
                                    .scrollContentBackground(.hidden)
                                    .padding(10)
                                    .frame(width: 320, height: 126)
                                    .background(Color.clear)
                                
                                if viewModel.draftUserBio.isEmpty {
                                    Text("소개를 입력하세요")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color.black_3)
                                        .padding(.trailing, 178)
                                        .padding(.bottom, 70)
                                }
                            }
                            .frame(width: 320, height: 126)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black_4, lineWidth: 1)
                            )
                        }
                        .padding(.horizontal, 47)
                        .padding(.bottom, 25)
                        
                        // 완료버튼
                        HStack{
                            Spacer()
                            Button{
                                viewModel.saveUserData() // 확정
                                dismiss()
                            } label : {
                                Rectangle()
                                    .frame(width: 105, height: 52)
                                    .foregroundStyle(Color.Red_2)
                                    .cornerRadius(12)
                                    .overlay(
                                        Text("완료")
                                            .font(.system(size: 20))
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
                .toolbar(.hidden, for: .tabBar)
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
                        .padding(.bottom, UIScreen.main.bounds.height <= 812 ? 200 : 150)
                }
            }
            .navigationDestination(isPresented: $showGalleryProfile) {
                GalleryProfileView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    EditProfileView(viewModel: ProfileViewModel())
}
