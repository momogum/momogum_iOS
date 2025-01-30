//
//  NearAppointCellView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct NearAppointCellView: View {
    @Binding var isPresented: Bool

    let appoint: Appoint
    
    let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
    
    
    var body: some View {
        
        Rectangle()
            .frame(width: 160, height: 220)
            .foregroundStyle(.black_5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                VStack (alignment: .leading) {
                    Text("\(appoint.pickedDate, formatter: dateFormatter())")
                        .font(.mmg(.Caption2))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    Text(appoint.senderName)
                        .font(.mmg(.Body4))
                    + Text("님이")
                        .font(.mmg(.Body3))
                    
                    Text(appoint.appointName)
                        .font(.mmg(.Body4))
                    + Text("에 초대합니다")
                        .font(.mmg(.Body3))
                    
                    Spacer()
                    Button {
                        isPresented = true
                    } label: {
                        Text("초대장 열기")
                            .font(.mmg(.Caption1))
                            .frame(width: 120, height: 25)
                            .background(.Red_2)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
            .padding(.trailing, 10)
    }
}

#Preview {
    NearAppointCellView(isPresented: .constant(false), appoint: Appoint.DUMMY_APM)
}
