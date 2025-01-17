//
//  AppointPickedFriendCellView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointPickedFriendCellView: View {
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.gray.opacity(0.5))
                
                Image(systemName: "xmark.circle")
                    .resizable()
                    .background(.gray)
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                    .offset(x: 25, y: -25)
            }
            Text("이름")
        }
        .frame(width: 80, height: 110)
        .padding(.top, 5)
//        .border(.black)
    }
}

#Preview {
    AppointPickedFriendCellView()
}
