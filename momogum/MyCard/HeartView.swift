//
//  HeartView.swift
//  momogum
//
//  Created by 조승연 on 2/3/25.
//

import SwiftUI

struct HeartView: View {
    @Binding var likeCount: Int
    @State private var isLiked = false

    var body: some View {
        HStack {
            Button(action: {
                isLiked.toggle()
                likeCount += isLiked ? 1 : -1
            }) {
                Image(isLiked ? "heart_fill" : "heart")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Spacer().frame(width: 12)

            Text("\(likeCount)")
                .font(.system(size: 16))
                .opacity(likeCount > 0 ? 1 : 0)
        }
        .frame(minWidth: 50) 
    }
}

#Preview {
    HeartView(likeCount: .constant(0))
}
