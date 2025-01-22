//
//  AppointView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct AppointView: View {
    @State var stack: NavigationPath = NavigationPath()
    @State var appointViewModel = AppointViewModel()
    
    var body: some View {
        NavigationStack {
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
                            NavigationLink {
                                AppointCreate1View(stack: $stack)
                                    .environment(appointViewModel)
                            } label: {
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
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        
                        Text("다가오는 식사 약속")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        ScrollView (.horizontal, showsIndicators: true) {
                            HStack {
                                NearAppointCellView()
                                NearAppointCellView()
                                NearAppointCellView()
                            }
                        }
                        
                        
                        Text("받은 초대장")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                    }
                    
                    
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    AppointView()
}
