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
    
    init(@ViewBuilder content: () -> Content, path: Binding<[String]>) {
        self.content = content()
        self._path = path
    }
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        VStack {
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
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.resetAppoint()
                    path.removeLast(path.count)
                } label: {
                    Image("close")
                }
            }
        }
    }
    
}
