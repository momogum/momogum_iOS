//
//  FollowerCell.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct FollowerCell: View {
    var body: some View {
        HStack{
            // 프로필 사진
            Image("pixelsImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())
                .padding(5)
                .overlay(
                    Circle()
                        .stroke(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255), lineWidth: 4)
                )
                .padding(.trailing, 20)
            
            VStack(alignment: .leading){
                // 유저이름
                Text("이름")
                    .frame(height: 16)
                    .fontWeight(.semibold)
                
                // 유저 아이디
                Text("유저 아이디")
                    .frame(height: 12)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.gray)
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    FollowerCell()
}
