//
//  ApmTextFieldModifier.swift
//  momogum
//
//  Created by nelime on 1/28/25.
//

import SwiftUI

struct ApmTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.mmg(.Body3))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding(.leading)
            .frame(height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.black_5)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.vertical, 20)
//            .border(.black)
    }
}
