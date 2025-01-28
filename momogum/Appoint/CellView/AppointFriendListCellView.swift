//
//  AppointFriendListCellView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointFriendListCellView: View {
    var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray.opacity(0.5))
                .padding(.horizontal)
            VStack (alignment: .leading) {
                Text("이름")
                    .fontWeight(.bold)
                Text("유저 아이디")
                    .fontWeight(.light)
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray)
                    .padding(.trailing, 30)
            }
        }
    }
}

#Preview {
    AppointFriendListCellView()
}
