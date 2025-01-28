//
//  AppointCreateView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

/// 약속 생성의 1단계, 친구 선택하는 뷰
struct AppointCreate1View: View {
    @Environment(\.dismiss) var dismiss
    @Environment(NewAppointViewModel.self) var appointViewModel
    
    @State var searchText = ""
    @Binding var path: [String]
    
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
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
                            .onTapGesture {
                                
                            }
                    }
                    
                }
            }
            
            HStack {
                Spacer()
                NavigationLink(value: "create2") {
                    Text("다음")
                        .fontWeight(.bold)
                        .frame(width: 90, height: 40)
                        .background(.black.opacity(0.7))
                        .foregroundStyle(.white)
                        .clipShape(Rectangle())
                        .padding(.trailing, 30)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("약속잡기")
        .navigationBarBackButtonHidden(true)
        .toolbarVisibility(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .tint(.black)
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.resetAppoint()
                    path.removeLast(path.count)
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    AppointCreate1View(path: AppointView().$path)
        .environment(NewAppointViewModel())
}
