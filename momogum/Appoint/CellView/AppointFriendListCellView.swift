//
//  AppointFriendListCellView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointFriendListCellView: View {
    let friend: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray.opacity(0.2))
                .padding(.trailing)
            
            VStack (alignment: .leading) {
                Text("유저 아이디")
                    .font(.mmg(.subheader4))
                
                Text(friend)
                    .font(.mmg(.Caption3))
            }
            Spacer()
        }
    }
}

#Preview {
    AppointFriendListCellView(friend: "친구")
}
