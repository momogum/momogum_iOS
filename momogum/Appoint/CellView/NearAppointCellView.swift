//
//  NearAppointCellView.swift
//  momogum
//
//  Created by nelime on 1/16/25.
//

import SwiftUI

struct NearAppointCellView: View {
    let appoint: Appoint
    
    var body: some View {
        
        Rectangle()
            .frame(width: 156, height: 219)
            .foregroundStyle(.gray.opacity(0.2))
            .overlay {
                VStack (alignment: .leading) {
                    Text("\(appoint.pickedDate)")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(appoint.placeName)
                        .font(.system(size: 14))
                    Text(appoint.appointName)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 2)
                    Text(appoint.menuName)
                        .font(.system(size: 14))
                    
                    NavigationLink {
                        AppointCheckingView(appoint: appoint)
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
            }
    }
}

#Preview {
    NearAppointCellView(appoint: Appoint.DUMMY_APM)
}
