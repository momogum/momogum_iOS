//
//  NearAppointCellView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct NearAppointCellView: View {
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 150)
            .foregroundStyle(.gray.opacity(0.2))
            .overlay {
                VStack (alignment: .leading) {
                    Text("12월 14일 금요일 12:00")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("중앙동 다이소 앞")
                        .font(.system(size: 14))
                    Text("대파밈 모임")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 2)
                    Text("편백찜")
                        .font(.system(size: 14))
                    
                    Button {
                        print("detail")
                    } label: {
                        Text("약속 자세히 보기")
                            .font(.caption)
                            .frame(width: 120, height: 25)
                            .background(.gray.opacity(0.5))
                            .foregroundStyle(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                }
                .padding()
//                .border(.black)
            }
    }
}

#Preview {
    NearAppointCellView()
}
