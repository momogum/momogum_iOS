//
//  UserInfoView.swift
//  momogum
//
//  Created by 조승연 on 2/3/25.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("유저아이디")
                    .font(.system(size: 16, weight: .bold))
                Text("포스팅 날짜")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

#Preview {
    UserInfoView()
}
