//
//  AppointCreate2View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

/// 약속생성의 2단계, 식사카드를 고르는 뷰
struct AppointCreate2View: View {
    @Environment(NewAppointViewModel.self) var appointViewModel
    
    @Binding var path: [String]
    
    var body: some View {
        @Bindable var viewModel = appointViewModel

        ApmBackgroundView(path: $path) {
            VStack {
                Text("어울리는 식사 카드를 골라주세요")
                    .font(.mmg(.Body2))
                    .padding(.top, 30)
                
                VStack {
                    Text("기본")
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<5) { i in
                                Rectangle()
                                    .frame(width: 170, height: 120)
                                    .foregroundStyle(.gray.opacity(0.2))
                            }
                        }
                    }
                    
                    
                    Text("재미")
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                            
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                            
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                        }
                    }
                    
                    
                    Text("진중")
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                            
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                            
                            Rectangle()
                                .frame(width: 170, height: 120)
                                .foregroundStyle(.gray.opacity(0.2))
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 20)

            }
            if viewModel.pickedImage != "" {
                ApmHoveringNavButton(navLinkValue: "create3")
            }
        }
    }
}

#Preview {
    AppointCreate2View(path: AppointView().$path)
        .environment(NewAppointViewModel())

}
