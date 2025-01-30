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
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(value: "create3") {
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
    AppointCreate2View(path: AppointView().$path)
        .environment(NewAppointViewModel())

}
