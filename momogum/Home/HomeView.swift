//
//  HomeView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var tabIndex: Int
    @State private var selectedButtonIndex: Int? = nil // 선택된 버튼의 인덱스
    @State private var userInput: String = ""
    
    // 그리드 형식 게시물
    let columns = [
        GridItem(.flexible()), // 각 아이템은 flexible하게 크기 조정.
        GridItem(.flexible())
    ]
    
    // 버튼 색상
    let normalButtonColor = Color(.systemGray5)
    let selectedButtonColor = Color(red: 224 / 255, green: 90 / 255, blue: 85 / 255) // E05A55
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("LoGo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 106, height: 37)
                        .clipped() // 이미지 외부 영역 제거
                        .padding(.leading, 24)
                    
                    Spacer()
                        .frame(width: 135)
                    
                    NavigationLink(destination: SearchView()) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .padding(.trailing, 3)
                    }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    NavigationLink(destination: BellView()) {
                        Image(systemName: "bell")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .padding(.trailing, 33)
                    }
                }
                .background(Color.clear) // 배경을 투명하게 설정
                .cornerRadius(10)
                .padding(.horizontal, 16)
                
                Spacer()
                    .frame(height: 40)
                // Story
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack {
                            NavigationLink(destination: StoryView(userID: "")) {
                                Circle()
                                    .foregroundColor(Color(red: 207 / 255, green: 207 / 255, blue: 207 / 255)) // #CFCFCF 색상
                                    .padding(8)
                                    .cornerRadius(10)
                                    .frame(width: 88, height: 88)
                            }
                            Text("내 스토리")
                                .bold()
                                .font(.system(size: 10))
                        }
                        
                    }
                }
                Spacer()
                    .frame(height: 60)
                HStack {
                    Text("다양한 밥일기 \n둘려보기")
                        .bold()
                        .font(.system(size: 24))
                        .padding(.leading, 24) // 텍스트 왼쪽에 20pt 여백 추가
                    Spacer()
                }
                
                // 버튼 섹션
                HStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { index in
                        Button(action: {
                            selectedButtonIndex = index // 선택된 버튼 인덱스 업데이트
                        }) {
                            Text(buttonLabel(for: index))
                                .padding(.horizontal, 16)
                                .frame(height: 32)
                                .background(selectedButtonIndex == index ? selectedButtonColor : normalButtonColor) // 동적 색상
                                .foregroundColor(.white)
                                .bold()
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.top, 24)
                .padding(.leading, 12)
                
                if selectedButtonIndex != nil {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) { // columns는 이미 정의된 GridItem 배열
                            ForEach(0..<6) { index in
                                NavigationLink(destination: GalleryPickerView()) {
                                    VStack(spacing: 0) {
                                        // 상단 이미지 부분
                                        Rectangle()
                                            .fill(Color.gray) // 사진 대신 회색으로 표시 (이미지로 교체 가능)
                                            .frame(width: 166, height: 166)
                                        
                                        // 하단 흰색 배경
                                        ZStack {
                                            Color.white
                                                .frame(width: 166, height: 75) // 하단 부분 높이: 241 - 166 = 75
                                            
                                            // 프로필 이미지와 텍스트
                                            HStack(spacing: 8) {
                                                Circle()
                                                    .fill(Color.gray) // 프로필 이미지 대신 파란색 원
                                                    .frame(width: 36, height: 36)
                                                
                                                Text("식사메뉴")
                                                    .font(.system(size: 14, weight: .bold))
                                                    .foregroundColor(.black)
                                                
                                                Spacer() // 남은 공간 채우기
                                            }
                                            .frame(width: 144, height: 36) // 전체 프레임
                                        }
                                    }
                                    .frame(width: 166, height: 241)
                                    .cornerRadius(10) // 전체 사각형 테두리 둥글게
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10) // 테두리를 추가
                                            .stroke(Color.gray, lineWidth: 1) // 테두리 색상과 두께
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                Spacer()
                
            }
        }
    }
    
    // 버튼 레이블 설정
    private func buttonLabel(for index: Int) -> String {
        switch index {
        case 0: return "또올래요:)"
        case 1: return "떡볶이"
        case 2: return "돈까스"
        case 3: return "피자"
        default: return ""
        }
    }
}

#Preview {
    HomeView(tabIndex: .constant(0))
}

