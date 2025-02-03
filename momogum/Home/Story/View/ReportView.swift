//
//  ReportView.swift
//  momogum
//
//  Created by 김윤진 on 1/31/25.
//

import SwiftUI

struct ReportView: View {
    @State private var selectedReason: String? = nil // 선택된 신고 사유
    @State private var showPopup: Bool = false // 팝업 표시 상태

    var body: some View {
        ZStack {
            VStack {
                // 헤더
                Text("신고하기")
                    .font(.headline)
                    .padding(.top, 12)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                    .padding(.top, 24)
                    .foregroundColor(.gray)
                
                Text("이 게시물을 신고하는 사유를 선택해주세요.")
                    .font(.mmg(.subheader4))
                    .padding(.top, 50)
                
                Text("신고는 익명으로 처리됩니다")
                    .font(.mmg(.Body4))
                    .padding(.top, 20)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                    .padding(.top, 64)
                    .foregroundColor(.gray)
                
                VStack(spacing: 8) {
                    ReportCellView(title: "잘못된 정보", isSelected: selectedReason == "가") {
                        selectedReason = "가"
                        showPopup = true
                    }
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.gray)

                    ReportCellView(title: "상업적 광고", isSelected: selectedReason == "나") {
                        selectedReason = "나"
                        showPopup = true
                    }
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.gray)

                    ReportCellView(title: "음란물", isSelected: selectedReason == "다") {
                        selectedReason = "다"
                        showPopup = true
                    }
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.gray)

                    ReportCellView(title: "폭력성", isSelected: selectedReason == "라") {
                        selectedReason = "라"
                        showPopup = true
                    }
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            
            // ✅ 팝업 (중앙에 표시)
            if showPopup {
                VStack {
                    Text("신고가 접수되었습니다.\n검토는 최대 24시간 소요됩니다.")
                        .font(.mmg(.Body3))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.gray)
                        .padding(.top, 20)

                    Button(action: {
                        showPopup = false
                    }) {
                        Text("확인")
                            .font(.mmg(.subheader4))
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .background(Color.white)
                    }
                }
                .frame(width: 319, height: 185)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
    }
}

// ✅ 신고 사유 셀 뷰 (배경 X)
struct ReportCellView: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.mmg(.Body3))
                .foregroundColor(.black) // 텍스트 색상 유지
                .padding(.leading, 20)
            Spacer()
        }
        .frame(width: 300, height: 50)
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    ReportView()
}
