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
                        .frame(width: 107, height: 37)
                        .clipped()
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    
                    Spacer()
                        .frame(width: 124)
                    
                    NavigationLink(destination: SearchView()) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .padding(.trailing, 12)
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    NavigationLink(destination: BellView()) {
                        Image(systemName: "bell")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .padding(.trailing, 27)
                            .padding(.top, 20)
                    }
                }
                .background(Color.clear)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                
                Spacer()
                    .frame(height: 40)
                
                // ✅ 기존 코드 유지 + 스토리 테두리 추가
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack {
                            NavigationLink(destination: StoryView(userID: "", tabIndex: $tabIndex)) {
                                ZStack {
                                    // 테두리 추가 (스토리가 있으면 그라데이션, 없으면 회색)
                                    Circle()
                                        .strokeBorder(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 6
                                        )
                                        .frame(width: 90, height: 90)
                                    
                                    // 기존 원 (프로필 이미지)
                                    Circle()
                                        .foregroundColor(Color(red: 207 / 255, green: 207 / 255, blue: 207 / 255))
                                        .frame(width: 76, height: 76)
                                }
                            }
                            Text("내 스토리")
                                .bold()
                                .font(.mmg(.Caption2))
                        }
                        .padding(.leading, 24)
                        
                        VStack {
                            NavigationLink(destination: Story2View(userID: "")) {
                                ZStack {
                                    // 스토리가 있으면 그라데이션 테두리, 없으면 회색 테두리
                                    Circle()
                                        .strokeBorder(
                                            LinearGradient(gradient: Gradient(colors: [
                                                Color(red: 249 / 255, green: 143 / 255, blue: 140 / 255),
                                                Color(red: 224 / 255, green: 90 / 255, blue: 85 / 255)
                                            ]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                            lineWidth: 6
                                        )
                                        .frame(width: 90, height: 90)
                                    
                                    // 기존 원 (프로필 이미지)
                                    Circle()
                                        .foregroundColor(Color(red: 207 / 255, green: 207 / 255, blue: 207 / 255))
                                        .frame(width: 76, height: 76)
                                }
                            }
                            Text("momogum._.")
                                .bold()
                                .font(.mmg(.Caption2))
                        }
                        .padding(.leading, 16)
                    }
                }
                
                Spacer()
                    .frame(height: 60)
                
                HStack {
                    Text("다양한 밥일기 \n둘려보기")
                        .bold()
                        .font(.mmg(.subheader1))
                        .padding(.leading, 24)
                    Spacer()
                }
                
                // 버튼 섹션
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<9, id: \.self) { index in // 버튼 수에 맞춰 반복문 범위 수정
                            Button(action: {
                                selectedButtonIndex = index // 선택된 버튼 인덱스 업데이트
                            }) {
                                Text(buttonLabel(for: index))
                                    .font(.mmg(.subheader4))
                                    .padding(.horizontal, 16)
                                    .frame(height: 32) // 높이는 고정
                                    .fixedSize(horizontal: true, vertical: false) // 텍스트 길이에 맞춰 너비 자동 조정
                                    .background(selectedButtonIndex == index ? selectedButtonColor : normalButtonColor) // 동적 색상
                                    .foregroundColor(selectedButtonIndex == index ? .white : .gray) // 동적 텍스트 색상
                                    .bold()
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top, 24)
                    .padding(.leading, 12)
                }
                
                
                
                if selectedButtonIndex != nil {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) { // columns는 이미 정의된 GridItem 배열
                            ForEach(0..<6) { index in
                                NavigationLink(destination: GalleryPickerView(tabIndex: $tabIndex, isTabBarHidden: .constant(false))) {
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
                                                    .font(.mmg(.Caption1))
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
        case 1: return "한식"
        case 2: return "중식"
        case 3: return "일식"
        case 4: return "양식"
        case 5: return "아시안"
        case 6: return "패스트푸드"
        case 7: return "카페"
        case 8: return "기타"
        default: return ""
        }
    }
}

#Preview {
    HomeView(tabIndex: .constant(0))
}
