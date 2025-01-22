//
//  AppointCreateView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct AppointCreate1View: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AppointViewModel.self) var appointViewModel
    
    @Binding var stack: NavigationPath
    @State var searchText = ""
    
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        VStack {
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
                .padding(.top)
                //            .border(.black)
            }
            .defaultScrollAnchor(.center)
            
            AppointFriendSearchView()
            
            HStack {
                Spacer()
                NavigationLink {
                    AppointCreate2View(stack: $stack)
                        .environment(viewModel)
                } label: {
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
                    stack.removeLast(stack.count)

                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    AppointCreate1View(stack: AppointView().$stack)
        .environment(AppointViewModel())
}
