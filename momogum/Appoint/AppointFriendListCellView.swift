//
//  AppointFriendListCellView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointFriendListCellView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundStyle(.gray.opacity(0.5))
            VStack (alignment: .leading) {
                Text("이름")
                Text("유저 아이디")
            }
        }
    }
}

#Preview {
    AppointFriendListCellView()
}
