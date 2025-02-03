//
//  ApmHoveringNavButton.swift
//  momogum
//
//  Created by nelime on 1/31/25.
//

import SwiftUI

struct ApmHoveringNavButton: View {
    let navLinkValue: String
    
    var body: some View {
        /// '다음 버튼'
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(value: navLinkValue) {
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

#Preview {
    ApmHoveringNavButton(navLinkValue: "")
}
