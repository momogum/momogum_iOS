//
//  MealIconView.swift
//  momogum
//
//  Created by 조승연 on 1/30/25.
//

import SwiftUI

struct MealIconView: View {
    @Binding var selectedIcon: String?
    
    private let textColor = Color(hex: 0xA2A2A2)
    private let selectedTextColor = Color(hex: 0xE05A55)
    
    var body: some View {
        VStack {
            Text("또 오고 싶은 곳인가요?")
                .font(.headline)
                .padding(.bottom, 28)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)  // 텍스트를 오른쪽으로 조금 이동시킴

            HStack(spacing: 10) {
                Button(action: {
                    selectedIcon = "bad"
                }) {
                    VStack(spacing: 12) {
                        Image(selectedIcon == "bad" ? "bad_fill" : "bad")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("아니요")
                            .font(.system(size: 16))
                            .foregroundColor(selectedIcon == "bad" ? selectedTextColor : textColor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    selectedIcon = "soso"
                }) {
                    VStack(spacing: 12){
                        Image(selectedIcon == "soso" ? "soso_fill" : "soso")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("그저 그래요")
                            .font(.system(size: 16))
                            .foregroundColor(selectedIcon == "soso" ? selectedTextColor : textColor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    selectedIcon = "good"
                }) {
                    VStack(spacing: 12) {
                        Image(selectedIcon == "good" ? "good_fill" : "good")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("또 올래요!")
                            .font(.system(size: 16))
                            .foregroundColor(selectedIcon == "good" ? selectedTextColor : textColor)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding()
    }
}

#Preview {
    MealIconView(selectedIcon: .constant(nil))
}
