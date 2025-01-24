//
//  AppointSentView.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import SwiftUI

struct AppointSentView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var path: [String]
    
    var body: some View {
        VStack {
            Text("초대장 보내기 완료!")
            
            Rectangle()
                .frame(width: 170, height: 120)
                .foregroundStyle(.gray.opacity(0.2))
                .padding()
            
            NavigationLink {
                AppointCheckingView(appoint: Appoint.DUMMY_APM)
            } label: {
                Text("보낸 초대장 확인하기")
            }

        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
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
    AppointSentView(path: AppointView().$path)
}
