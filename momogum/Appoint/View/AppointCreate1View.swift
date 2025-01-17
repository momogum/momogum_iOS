//
//  AppointCreateView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct AppointCreate1View: View {
    var body: some View {
        
        @State var searchText = ""
        
        Text("식사를 함께할 친구를 선택해주세요")
            .font(.title3)
            .fontWeight(.bold)
            .padding(.vertical)
        
        ScrollView (.horizontal) {
            HStack {
                ForEach(0..<4) { _ in
                    AppointPickedFriendCellView()
                }
            }
            .padding(.vertical)
//            .border(.black)
        }
        .defaultScrollAnchor(.center)
        
        AppointFriendSearchView()
            .border(.black)
        
        HStack {
            Spacer()
            Button {
                print("next")
            } label: {
                Text("다음")
                    .fontWeight(.bold)
                    .frame(width: 90, height: 40)
                    .background(.black.opacity(0.7))
                    .foregroundStyle(.white)
                    .clipShape(Rectangle())
//                    .padding(.trailing, 30)
                
            }
        }
        
        Spacer()

    }
}

#Preview {
    AppointCreate1View()
}
