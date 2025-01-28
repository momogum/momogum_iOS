//
//  AppointView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

/// 약속잡기 메인 페이지
struct AppointView: View {

    @State var stack: NavigationPath = NavigationPath()

    @State var path: [String] = []
    @State var newAppointViewModel = NewAppointViewModel()
    @State var viewModel = AppointViewModel()
    
    var body: some View {
        NavigationStack (path: $path) {
            VStack (alignment: .leading) {
                ScrollView {
                    VStack (alignment: .leading) {
                        HStack {
                            NavigationLink(value: "create1") {
                                Rectangle()
                                    .frame(width: 336, height: 146)
                                    .tint(Color.white.opacity(1))
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 3)
                                        .tint(.gray.opacity(0.5)))
                                    .overlay {
                                        VStack {                                            Image(systemName: "plus.circle.fill")
                                                .resizable()
                                                .frame(width: 35, height: 35)
                                                .foregroundStyle(.gray.opacity(0.5))
                                                .padding(.bottom, 16)

                                            Text("식사 약속 만들기")
                                                .foregroundStyle(.black)
                                                .font(.mmg(.subheader3))
                                            
                                            
                                        }
                                    }
                                    .padding(.vertical, 30)
                            }
                            .navigationDestination(for: String.self) { value in
                                if value == "create1" {
                                    AppointCreate1View(path: $path)
                                        .environment(newAppointViewModel)
                                } else if (value == "create2") {
                                    AppointCreate2View(path: $path)
                                        .environment(newAppointViewModel)
                                } else if (value == "create3") {
                                    AppointCreate3View(path: $path)
                                        .environment(newAppointViewModel)
                                } else if (value == "create4") {
                                    AppointCreate4View(path: $path)
                                        .environment(newAppointViewModel)
                                } else {
                                    AppointSentView(path: $path)
                                }
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack (alignment: .leading) {
                            Text("수락 대기 중인 약속")
                                .font(.mmg(.subheader3))
                            
                            
                            Text("당신의 결정을 기다리는 약속이 있어요!")
                                .font(.mmg(.subheader4))
                            
                            ScrollView (.horizontal, showsIndicators: true) {
                                HStack {
                                    ForEach(viewModel.appoints) { appoint in
                                        NearAppointCellView(appoint: appoint)
                                    }
                                }
                            }
                            .ignoresSafeArea()
                            .padding(.vertical, 20)
                            
                            Text("다가오는 식사 약속")
                                .font(.mmg(.subheader3))
                            
                            ScrollView (.horizontal, showsIndicators: true) {
                                HStack {
                                    ForEach(viewModel.appoints) { appoint in
                                        NearAppointCellView(appoint: appoint)
                                    }
                                }
                            }
                            .padding(.vertical, 20)
                        }
                        .padding(.leading, 30)
                    }
                    
                    
                }
            }
            .refreshable {
                await viewModel.loadAllAppoints()
            }
            .task {
                await viewModel.loadAllAppoints()
                
            }
        }
    }
}

#Preview {
    AppointView()
}
