//
//  FollowingCell.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct FollowingCell: View {
    var userID: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            // 프로필 사진
            Image("defaultProfile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .padding(.trailing, 16)
            
            VStack(alignment: .leading, spacing: 0){
                // 유저 아이디
                Text("\(userID)")
                    .font(.mmg(.subheader4))
                    .foregroundStyle(Color.black_1)
                    .padding(.bottom, 4)
                
                // 유저이름
                Text("이름")
                    .font(.mmg(.Caption3))
                    .foregroundStyle(Color.black_1)
            }
            
            Spacer()
            
            // 취소버튼
            Button{
                
            } label: {
                Image("close_s")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .padding(.trailing, 12)
        }
        .frame(maxWidth: .infinity)
    }
}
