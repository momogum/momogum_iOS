//
//  AppointSentView.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import SwiftUI

/// 약속생성의 마지막 단계, 초대장을 보냈다는 화면 + 초대장 확인 버튼
struct AppointSentView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: [String]
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("초대장 보내기 완료!")
                .font(.mmg(.subheader2))
                .padding(.bottom, 20)
            
            Rectangle()
                .frame(width: 170, height: 120)
                .foregroundStyle(.gray.opacity(0.2))
                .padding()
            
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                Text("보낸 초대장 확인하기")
                    .font(.mmg(.subheader3))
                    .frame(width: 280, height: 60)
                    .background(.black_6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                    }
                    .foregroundStyle(.Red_2)

                    
            }

            Spacer()
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            AppointCheckingView(appoint: Appoint.DUMMY_APM)

        })
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path.removeLast(path.count)
                } label: {
                    Image("cancle")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    AppointSentView(path: AppointView().$path)
}
