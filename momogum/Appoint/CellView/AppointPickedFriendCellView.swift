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
        
        ZStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray.opacity(0.2))
            
            Button {
                viewModel.pickedFriends.removeAll(where: { $0 == friend })
            } label: {
                Image("close_cc")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 18, height: 18)
            }
            .offset(x: 18, y: -18)
        }
        .padding(.top, 3)
        .padding(.trailing, 3)
        .padding(.bottom, 10)
    }
    
}

#Preview {
    AppointPickedFriendCellView(friend: "친구더미")
        .environment(NewAppointViewModel())
}
