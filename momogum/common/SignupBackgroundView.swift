//
//  SignupBackgroundView.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

struct SignupBackgroundView<Content: View>: View {

    let content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Text("정보 입력")
            .font(.system(size:20))
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.horizontal)
            .padding(.bottom,5)
        ZStack{
      
            content
        }
      
        Spacer()
    }
}

