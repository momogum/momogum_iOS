//
//  CommentView.swift
//  momogum
//
//  Created by 조승연 on 2/3/25.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        HStack {
            Image("comment") 
                .resizable()
                .frame(width: 24, height: 24)
            
            Spacer().frame(width: 12)

            Text("5")
                .font(.system(size: 16))
        }
    }
}

#Preview {
    CommentView()
}
