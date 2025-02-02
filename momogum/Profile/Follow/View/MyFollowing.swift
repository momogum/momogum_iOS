//
//  MyFollowing.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct MyFollowing: View {
    @State private var search: String = ""
    @State private var showCloseButton = false
    @State private var isEditing = false // 텍스트필드 활성화 여부
    @State private var loadedFollowings = 20 // 초기 로딩 개수
    @State private var allFollowings: [String] = [] // 전체 팔로잉 리스트
    
    @Bindable var viewModel: ProfileViewModel
    
    var filteredFollowings: [String] {
        if search.isEmpty {
            return Array(allFollowings.prefix(loadedFollowings)) // 검색어가 없으면 현재 로드된 만큼만 반환
        } else {
            return allFollowings.filter { $0.localizedCaseInsensitiveContains(search) } // 검색어가 포함된 데이터만 반환
        }
    }
    
    var body: some View {
        VStack{
            List{
                ZStack{
                    HStack(alignment: .center, spacing: 0) {
                        
                        Spacer()
                        
                        //검색바
                        TextField("닉네임 or 유저아이디로 검색", text: $search,
                                  onEditingChanged: { editing in
                            isEditing = editing
                            showCloseButton = editing
                        })
                        .padding(.leading, isEditing ? 0 : 43)
                        .padding(.horizontal, 23)
                        .frame(width: 353, height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black_5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 235 / 255, green: 232 / 255, blue: 232 / 255), lineWidth: 1)
                        )
                        .font(.mmg(.subheader4))
                        .foregroundStyle(isEditing ? Color.black_1 : Color.black_4)
                        .onChange(of: search) {
                            showCloseButton = true
                        }
                        .onSubmit { // 엔터 입력 후
                            // 검색창이 비어있으면 돋보기 보임
                            isEditing = search.isEmpty ? false : true
                            showCloseButton = false
                        }
                        
                        Spacer()
                        
                    }
                    
                    // 텍스트 필드 활성화 전
                    if !isEditing {
                        HStack(alignment: .center, spacing: 0){
                            Image("search")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.leading, 45)
                            
                            Spacer()
                        }
                    }
                    
                    if showCloseButton {
                        HStack{
                            Spacer()
                            Button{
                                search = ""
                                showCloseButton = false
                            }label:{
                                Image("close_black3")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.trailing, 42)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 36)
                
                
                // 팔로워 목록
                ForEach(filteredFollowings.indices, id: \.self) { index in
                    let userID = filteredFollowings[index] // userID만 저장된 배열
                    
                    FollowingCell(userID: userID)
                        .onAppear {
                            if index == filteredFollowings.count - 1 {
                                loadMoreFollowers()
                            }
                        }
                        .listRowSeparator(.hidden)
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 5)
                }
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            generateFollowers()
        }
    }
    
    // 더미 데이터 생성 (테스트용)
    private func generateFollowers() {
        allFollowings = (0..<viewModel.followingCount).map { "유저 아이디\($0 + 1)" }
    }
    
    // 더 많은 팔로워 로드 (페이징)
    private func loadMoreFollowers() {
        let nextBatch = min(loadedFollowings + 20, allFollowings.count)
        if loadedFollowings < nextBatch {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                loadedFollowings = nextBatch
            }
        }
    }
}
