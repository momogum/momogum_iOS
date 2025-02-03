//
//  PopupMenuView.swift
//  momogum
//
//  Created by 조승연 on 2/3/25.
//

import SwiftUI

struct PopupMenuView: View {
    @Binding var showPopup: Bool

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                print("수정 버튼 클릭")
                showPopup = false
            }) {
                Text("수정")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(Color.white)
            }
            
            Divider()
                .padding(.horizontal, 10)

            Button(action: {
                print("삭제 버튼 클릭")
                showPopup = false
            }) {
                Text("삭제")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(Color.white)
            }
        }
        .frame(width: 159, height: 104)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .position(x: UIScreen.main.bounds.width - 100, y: 120)
        .transition(.opacity)
    }
}
