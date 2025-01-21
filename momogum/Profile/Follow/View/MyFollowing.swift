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
                Section {
                    HStack {
                        Spacer()
                        // 검색바
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 336, height: 40)
                            .foregroundStyle(Color(red: 235 / 255, green: 232 / 255, blue: 232 / 255))
                            .overlay(
                                TextField("검색", text: $search)
                                    .padding(.horizontal, 16)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16)) 
                            )
                        Spacer()
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 44)
                }
                
                
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
