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
                HStack {
                    Text("로고")
                        .frame(height: 80)
                    Spacer()
                }
                
                Divider()
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("약속 잡기")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        HStack {
                            NavigationLink(value: "create1") {
                                Rectangle()
                                    .frame(width: 250, height: 150)
                                    .tint(.gray.opacity(0.5))
                                    .overlay {
                                        VStack {
                                            Text("식사약속 만들기")
                                                .foregroundStyle(.black)
                                                .padding(.bottom)
                                            Image(systemName: "plus")
                                                .foregroundStyle(.black)
                                        }
                                    }
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
                        
                        
                        
                        Text("다가오는 식사 약속")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        ScrollView (.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(viewModel.appoints) { appoint in
                                    NearAppointCellView(appoint: appoint)
                                }
                            }
                        }
                        
                        
                        Text("받은 초대장")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        ScrollView (.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach(viewModel.appoints) { appoint in
                                    NearAppointCellView(appoint: appoint)
                                }
                            }
                        }
                    }
                    
                    
                }
            }
            .padding(.horizontal, 10)
            .refreshable {
                print("refreshed")
                await viewModel.loadAllAppoints()
                print(viewModel.appoints.count)
            }
            .task {
                print("task-refreshed")
                await viewModel.loadAllAppoints()
                
            }
        }
    }
}

#Preview {
    AppointView()
}
