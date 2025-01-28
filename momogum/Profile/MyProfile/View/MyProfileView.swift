//
//  MyProfileView.swift
//  momogum
//
//  Created by 류한비 on 1/18/25.
//

import SwiftUI

struct MyProfileView: View {
    @State private var selectedSegment = 0
    @State private var showFollowList = 0
    @State private var isActive = false // 화면 전환 제어
    // 팝업창 제어
    @State private var showPopup = false
    @State private var showLogoutPopup = false
    @State private var showDelPopup = false
    
    @State var viewModel: ProfileViewModel = ProfileViewModel()
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    var body: some View {
        ZStack{
            NavigationStack{
                VStack{
                    VStack{
                        HStack(alignment: .center){
                            
                            Spacer()
                            Spacer().frame(width: 24, height: 24)
                            
                            // 내 유저 아이디
                            Text("\(viewModel.userID)")
                                .frame(height: 20)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            // 설정 버튼
                            Button{
                                showPopup = true
                            } label: {
                                Image("settings")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        .padding(.horizontal, 31)
                        .padding(.top, 23)
                        .padding(.bottom, 20)
                        
                        HStack(spacing: 0){
                            // 프로필 이미지
                            if let profileImage = viewModel.profileImage {
                                profileImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 88, height: 88)
                                    .clipShape(Circle())
                                    .padding(.trailing, 35)
                            } else {
                                Image("defaultProfile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 88, height: 88)
                                    .clipShape(Circle())
                                    .padding(.trailing, 35)
                            }
                            
                            // 이름 / 한 줄 소개
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    // 이름
                                    Text("\(viewModel.userName)")
                                        .frame(height: 16, alignment: .leading)
                                        .fontWeight(.semibold)
                                    
                                    Text("\(viewModel.userBio)")
                                        .frame(height: 12, alignment: .leading)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.bottom, 16)
                                
                                // 팔로워, 팔로잉
                                HStack{
                                    Button(action: {
                                        showFollowList = 0
                                        isActive = true // 팔로워 버튼 클릭 시 화면 전환
                                    }) {
                                        Text("팔로워 17")
                                            .frame(height: 13, alignment: .leading)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        showFollowList = 1
                                        isActive = true // 팔로잉 버튼 클릭 시 화면 전환
                                    }) {
                                        Text("팔로잉 14")
                                            .frame(height: 13, alignment: .leading)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: FollowView(selectedSegment: $showFollowList), isActive: $isActive) {
                                        EmptyView()
                                    }
                                    
                                }
                                
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: .infinity)
                        .padding(.leading, 35)
                        .padding(.trailing, 37)
                    }
                    
                    // 프로필 편집 버튼
                    NavigationLink{
                        EditProfileView(viewModel: viewModel)
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 315, height: 36)
                            .foregroundStyle(Color(red: 235 / 255, green: 232 / 255, blue: 232 / 255))
                            .overlay(
                                Text("프로필 편집")
                                    .frame(height: 10)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            )
                            .contentShape(Rectangle())
                    }
                    .padding(.top, 45)
                    .padding(.bottom, 49)
                    
                    
                    // 내 게시물 / 저장 게시물 SegmentedControl
                    HStack {
                        Image(systemName: "doc.text")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedSegment == 0 ? Color.black : .gray)
                            .cornerRadius(8)
                            .onTapGesture {
                                selectedSegment = (selectedSegment == 1) ? 0 : selectedSegment
                            }
                        
                        Image(systemName: "bookmark")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedSegment == 0 ? Color.gray : .black)
                            .cornerRadius(8)
                            .onTapGesture {
                                selectedSegment = (selectedSegment == 0) ? 1 : selectedSegment
                            }
                    }
                    .padding(.bottom, 41)
                    
                    // 게시물 Grid
                    ScrollView{
                        if selectedSegment == 0 {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(0..<30, id: \.self) { index in
                                    Rectangle()
                                        .frame(width: 160,height: 228)
                                        .foregroundStyle(Color.gray)
                                }
                            }
                            .padding(.horizontal, 30)
                        } else if selectedSegment == 1 {
                            Text("저장된 콘텐츠가 없습니다.")
                                .padding()
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    
                }
            }
            .disabled(showPopup) // 팝업이 보일 때 메인 화면 비활성화
            
            // 팝업 띄우기
            if showPopup {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showPopup = false // 바깥 영역 터치 시 팝업 비활성화
                    }
                
                SettingsPopupView(showPopup: $showPopup, showLogoutPopup: $showLogoutPopup, showDelPopup: $showDelPopup)
                    .padding(.bottom, UIScreen.main.bounds.height <= 812 ? 450 : 505)
                    .padding(.leading, UIScreen.main.bounds.height <= 812 ? 105 : 155)
                    .padding(.trailing, 37)
            } else if showLogoutPopup {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showLogoutPopup = false
                    }
                LogoutPopupView(showLogoutPopup: $showLogoutPopup)
            } else if showDelPopup {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showDelPopup = false
                    }
                DelAccPopupView(showDelPopup: $showDelPopup)
            }
            
        }
    }
}
