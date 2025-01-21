//
//  FollowView.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct FollowView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedSegment: Int
    
    var body: some View {
        VStack {
            HStack {
                // 팔로워 segment
                VStack {
                    Text("17 팔로워")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedSegment == 0 ? .black : .gray)
                        .onTapGesture {
                            selectedSegment = 0
                        }
                    
                    // 선택 하단선
                    Rectangle()
                        .frame(width: 112, height: 2)
                        .foregroundColor(selectedSegment == 0 ? .black : .clear)
                }
                
                // 팔로잉 segment
                VStack {
                    Text("14 팔로잉")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedSegment == 1 ? .black : .gray)
                        .onTapGesture {
                            selectedSegment = 1
                        }
                    
                    Rectangle()
                        .frame(width: 112, height: 2)
                        .foregroundColor(selectedSegment == 1 ? .black : .clear)
                }
            }
            .padding(.bottom, 23)
            
            // 팔로워 / 팔로잉 목록
            if selectedSegment == 0 {
                MyFollower()
            } else if selectedSegment == 1 {
                MyFollowing()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("내 유저아이디")
                    .frame(height: 20)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            // 뒤로가기 버튼
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    selectedSegment = 0
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(.black)
                }
            }
        }
    }
}
