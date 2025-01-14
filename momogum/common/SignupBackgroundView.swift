//
//  SignupBackgroundView.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

struct SignupBackgroundView<Content: View>: View {
    @Environment(\.dismiss) var dismiss    //환경변수에서 뒤로가는 정보를 dismiss에 저장하여 사용
    let content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Text("회원가입")
            .font(.system(size:20))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.horizontal)
            .padding(.bottom,5)
        ZStack{
      
            content
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                    dismiss()
                } label:{
                    Text("이전단계")
                        .tint(Color.black)
                }
            }
        }
        Spacer()
    }
}

