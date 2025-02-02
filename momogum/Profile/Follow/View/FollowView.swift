//
//  FollowView.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct FollowView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: ProfileViewModel
    
    @Binding var selectedSegment: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                // back 버튼
                Button{
                    dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .frame(width: 20,height: 20)
                }
                .padding(.leading, 32)
                
                Spacer()
                
                Text("\(viewModel.userID)")
                    .font(.mmg(.subheader3))
                    .foregroundColor(.black)
                
                Spacer()
                Spacer().frame(width: 20, height: 20)
            }
            .padding(.top, 82)
            .padding(.trailing, 32)
            
            HStack(alignment: .center, spacing: 0) {
                // 팔로워 segment
                VStack(alignment: .center, spacing: 0) {
                    Text("\(viewModel.followerCount.formattedFollowerCount())   팔로워")
                        .font(.mmg(.subheader4))
                        .foregroundColor(selectedSegment == 0 ? Color.black_1 : Color.black_3)
                        .onTapGesture {
                            selectedSegment = 0
                        }
                        .padding(.bottom, 15)
                    
                    // 선택 하단선
                    Rectangle()
                        .frame(width: 140, height: 2)
                        .foregroundColor(selectedSegment == 0 ? .black : .clear)
                }
                .padding(.trailing, 36)
                
                // 팔로잉 segment
                VStack(alignment: .center, spacing: 0) {
                    Text("\(viewModel.followingCount.formattedFollowerCount())   팔로잉")
                        .font(.mmg(.subheader4))
                        .foregroundColor(selectedSegment == 1 ? Color.black_1 : Color.black_3)
                        .onTapGesture {
                            selectedSegment = 1
                        }
                        .padding(.bottom, 15)
                    
                    Rectangle()
                        .frame(width: 140, height: 2)
                        .foregroundColor(selectedSegment == 1 ? .black : .clear)
                }
            }
            .padding(.bottom, 37)
            .padding(.top, 32)
            
            // 팔로워 / 팔로잉 목록
            if selectedSegment == 0 {
                MyFollower(viewModel: viewModel)
            } else if selectedSegment == 1 {
                MyFollowing(viewModel: viewModel)
            }
        }
        .navigationBarBackButtonHidden()
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    FollowView(viewModel: ProfileViewModel(), selectedSegment: .constant(0))
}
