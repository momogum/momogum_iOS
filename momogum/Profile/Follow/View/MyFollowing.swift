//
//  MyFollowing.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct MyFollowing: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack{
            List{
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    //검색바
                    TextField("닉네임 or 유저아이디로 검색", text: $search)
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
                        .foregroundStyle(Color.black_3)
                    Spacer()
                }
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 36)
                
                
                // 팔로워 목록
                ForEach(0..<20){_ in
                    FollowingCell()
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    MyFollowing()
}
