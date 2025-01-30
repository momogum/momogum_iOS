//
//  CardPostCell.swift
//  momogum
//
//  Created by 류한비 on 1/30/25.
//

import SwiftUI

struct CardPostCell: View {
    @Binding var selectedSegment: Int
    
    var body: some View {
        ZStack{
            Rectangle() // 추후 이미지로 변경
                .frame(width: 166,height: 241)
                .foregroundStyle(Color.black_5)
                .cornerRadius(8)
            
            Rectangle()
                .foregroundStyle(Color.white)
                .frame(width: 166,height: 75)
                .padding(.top, 168)
            
            Rectangle()
                .frame(width: 166,height: 241)
                .foregroundStyle(Color.clear)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black_4, lineWidth: 1)
                )
            if selectedSegment == 0{
                Text("식사메뉴")
                    .font(.mmg(.Caption1))
                    .foregroundColor(Color.black_1)
                    .padding(.top, 162)
                    .padding(.trailing, 100)
            } else if selectedSegment == 1 {
                HStack(alignment:.center, spacing: 0){
                    
                    Image("defaultProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                        .padding(.trailing, 8)
                    
                    Text("식사메뉴")
                        .font(.mmg(.Caption1))
                        .foregroundColor(Color.black_1)
                }
                .padding(.top, 162)
                .padding(.trailing, 55)
            }
            
        }
    }
}

#Preview {
    CardPostCell(selectedSegment: .constant(1))
}
