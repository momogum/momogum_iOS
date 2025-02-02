//
//  AppointCreateView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

/// 약속 생성의 1단계, 친구 선택하는 뷰
struct AppointCreate1View: View {
    @Environment(NewAppointViewModel.self) var appointViewModel
    @Binding var path: [String]
    
    @State var searchText = ""
    @State var isEditing: Bool = false
    
    var filteredFriends: [String] {
        if searchText.isEmpty {
            return appointViewModel.friends
        } else {
            return appointViewModel.friends.filter { friend in
                return friend.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        ApmBackgroundView(path: $path) {
            VStack {
                Text("식사를 함께할 친구를 선택해주세요")
                    .font(.mmg(.Body2))
                    .padding(.vertical, 30)
                
                /// 선택된 친구들 가로 스크롤 표시
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(viewModel.pickedFriends, id: \.self) { friend in
                            AppointPickedFriendCellView(friend: friend)
                                .environment(viewModel)
                        }
                    }
                }
                .defaultScrollAnchor(.center)
                
                /// 검색바
                HStack {
                    Image("search")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 10)
                    
                    TextField("닉네임 or 유저 아이디로 검색", text: $searchText)
                        .font(.mmg(.subheader4))
                    
                }
                .modifier(ApmTextFieldModifier())
                
                /// 친구 목록
                ScrollView {
                    VStack (spacing: 20) {
                        Text("친구")
                            .font(.mmg(.subheader3))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 15)
                        
                        /// 선택된 친구 상단 표시
                        ForEach(filteredFriends.filter { viewModel.pickedFriends.contains($0) },
                                id: \.self) { friend in
                            HStack {
                                AppointFriendListCellView(friend: friend)
                                Image("selected")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                toggleSelection(for: friend)
                            }
                        }
                        
                        // 전체 친구 표시
                        ForEach(filteredFriends.filter { !viewModel.pickedFriends.contains($0) },
                                id: \.self) { friend in
                            HStack {
                                AppointFriendListCellView(friend: friend)
                                Image("unselected")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                toggleSelection(for: friend)
                            }
                        }
                        
                    }
                    .padding(.bottom, 100)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 30)
            
            
            /// '다음 버튼'
            if !viewModel.pickedFriends.isEmpty {
                ApmHoveringNavButton(navLinkValue: "create2")
            }
        }
    }
    
    private func toggleSelection(for friend: String) {
        if appointViewModel.pickedFriends.contains(friend) {
            // 이미 선택된 친구라면 리스트에서 제거
            appointViewModel.pickedFriends.removeAll { $0 == friend }
        } else {
            // 선택되지 않은 친구라면 리스트에 추가
            appointViewModel.pickedFriends.append(friend)
        }
    }
}

#Preview {
    AppointCreate1View(path: AppointView().$path)
        .environment(NewAppointViewModel())
}
