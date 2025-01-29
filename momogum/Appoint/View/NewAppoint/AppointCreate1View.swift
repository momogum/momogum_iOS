//
//  AppointCreateView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

/// 약속 생성의 1단계, 친구 선택하는 뷰
struct AppointCreate1View: View {
    @Environment(NewAppointViewModel.self) var appointViewModel
    @Binding var path: [String]
    
    @State var searchText = ""
    
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        ApmBackgroundView(path: $path) {
            VStack {
                Text("식사를 함께할 친구를 선택해주세요")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                
                
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(viewModel.pickedFriends, id: \.self) { friend in
                            AppointPickedFriendCellView(friend: friend)
                                .environment(viewModel)
                        }
                    }
                    .padding(.top)
                }
                .defaultScrollAnchor(.center)
                
                ScrollView{
                    Text("친구")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    LazyVStack {
                        ForEach(0..<10) { _ in
                            AppointFriendListCellView()
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(value: "create2") {
                        Text("다음")
                            .font(.mmg(.subheader3))
                            .frame(width: 100, height: 50)
                            .background(.Red_2)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(30)
                    }
                }
            }
        }
    }
}

#Preview {
    AppointCreate1View(path: AppointView().$path)
        .environment(NewAppointViewModel())
}
