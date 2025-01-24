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
        VStack(alignment: .center, spacing: 0){
            
            // 프로필 이미지
            ZStack{
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
                .padding(.top, 124)
                .padding(.bottom, 60)
                .onTapGesture {
                    showPopup = true //클릭 시 팝업 표시
                }
                
                // 팝업 띄우기
                if showPopup {
                    // 팝업 창
                    
                    VStack() {
                        Button {
                            viewModel.resetEditingProfileImage() // 기본 이미지로 변경
                            showPopup = false
                        } label: {
                            Text("기본 이미지 사용")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .foregroundColor(.black)
                        }
                        
                        Divider()
                        
                        NavigationLink{
                            GalleryProfileView(viewModel: viewModel)
                        } label: {
                            Text("갤러리에서 선택")
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .foregroundColor(.black)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            showPopup = false // 팝업 닫기
                        })
                    }
                    .frame(width: 231, height: 146)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1) // 외곽선 색상과 두께 설정
                    )
                    .padding(.top, 239) // 상단 여백 추가
                }
            }
            .animation(.easeInOut, value: showPopup)
            
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
            
        }
        .toolbar(.hidden, for: .tabBar)
        .edgesIgnoringSafeArea(.all)
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
