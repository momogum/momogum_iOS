//
//  AppointPickedFriendCellView.swift
//  momogum
//
//  Created by nelime on 1/17/25.
//

import SwiftUI

struct AppointPickedFriendCellView: View {
    @Environment(NewAppointViewModel.self) var appointViewModel
    @State var friend: String
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        VStack {
            ZStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.gray.opacity(0.5))
                
                Button {
                    viewModel.pickedFriends.removeAll(where: { $0 == friend })
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                        .offset(x: 25, y: -25)
                }
            }
            Text(friend)
        }
        .frame(width: 80, height: 110)
        .padding(.top, 5)
    }
}

#Preview {
    AppointPickedFriendCellView(friend: "친구더미")
        .environment(NewAppointViewModel())
}
