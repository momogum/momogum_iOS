//
//  ReportView.swift
//  momogum
//
//  Created by 김윤진 on 1/31/25.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        VStack {
            Text("신고하기")
                .font(.headline)
                .padding()
            
            // 신고 내용 입력 및 버튼 등 추가할 UI 요소들
            Button("닫기") {
                // 모달 닫기
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ReportView()
}
