//
//  SignupTextfieldModifier.swift
//  momogum
//
//  Created by 서재민 on 1/13/25.
//

import SwiftUI

struct SignupTextfieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
            .padding(.leading, 11)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(Color.placeholderGray)
            .padding(.horizontal,32)
            .padding(.top,142)
            .overlay(
                Rectangle()
                    .frame(height: 3) // 밑줄 두께
                    .foregroundColor(Color.borderGray)
                    .offset(y: 15)
                    .padding(.horizontal, 32),
                     alignment: .bottom
            )

    }
}
