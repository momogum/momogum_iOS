//
//  ApmBackgroundView.swift
//  momogum
//
//  Created by nelime on 1/28/25.
//

import SwiftUI

struct ApmBackgroundView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    @Environment(NewAppointViewModel.self) var appointViewModel
    @Binding var path: [String]
    
    let content: Content

    init(path: Binding<[String]>, @ViewBuilder content: () -> Content) {
        self._path = path
        self.content = content()
    }
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        ZStack {
            content
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
                    Image("back")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 5)
                        .foregroundStyle(.black)
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.resetAppoint()
                    path.removeLast(path.count)
                } label: {
                    Image("close")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 5)
                        .foregroundStyle(.black)
                }
            }
        }
    }
    
}
