//
//  AppointCreate2View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

struct AppointCreate2View: View {
    @Environment(\.dismiss) var dismiss
    @Binding var stack: NavigationPath
    
    var body: some View {
        VStack (spacing: 15) {
            Text("어울리는 식사 카드를 골라주세요")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text("기본")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.horizontal)
            
            ScrollView (.horizontal, showsIndicators: true) {
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
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView (.horizontal, showsIndicators: true) {
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
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView (.horizontal, showsIndicators: true) {
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
            
            HStack {
                Spacer()
                NavigationLink {
                    AppointCreate3View(stack: $stack)
                } label: {
                    Text("다음")
                        .fontWeight(.bold)
                        .frame(width: 90, height: 40)
                        .background(.black.opacity(0.7))
                        .foregroundStyle(.white)
                        .clipShape(Rectangle())
                        .padding(.trailing, 30)
                    
                }
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("약속잡기")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .tint(.black)
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    stack.removeLast(stack.count)
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
            
    }
}

#Preview {
    AppointCreate2View(stack: AppointView().$stack)
}