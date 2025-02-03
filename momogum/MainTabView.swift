//
//  MainTabView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//


import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 0
    @State private var isTabBarHidden = false 

    init() {
        UITabBar.appearance().isHidden = true // 기본 탭 바 숨기기
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabIndex) {
                HomeView(tabIndex: $tabIndex)
                    .tag(0)

                GalleryPickerView(tabIndex: .constant(1), isTabBarHidden: $isTabBarHidden)
                    .tag(1)

                AppointView()
                    .tag(2)

                MyProfileView()
                    .tag(3)
            }

            if !isTabBarHidden {
                VStack {
                    ZStack {
                        // 회색 배경
                        Rectangle()
                            .fill(Color(UIColor.systemGray6))
                            .frame(height: 90)
                            .frame(maxWidth: .infinity)
                            .shadow(radius: 5)

                        // 탭 아이콘 및 텍스트 (배경 기준으로 위치 조정)
                        HStack {
                            CustomTabItem(icon: "house", title: "홈", selectedTab: $tabIndex, tab: 0)
                            Spacer()
                            CustomTabItem(icon: "plus", title: "업로드", selectedTab: $tabIndex, tab: 1)
                            Spacer()
                            CustomTabItem(icon: "calendar", title: "약속관리", selectedTab: $tabIndex, tab: 2)
                            Spacer()
                            CustomTabItem(icon: "person", title: "내프로필", selectedTab: $tabIndex, tab: 3)
                        }
                        .padding(.bottom, 15)
                        .padding(.horizontal, 30) // 좌우 여백 조정
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom) // 하단 여백 제거
    }
}

// 개별 탭 버튼 뷰 (탭 선택 시 색상 변경)
struct CustomTabItem: View {
    let icon: String
    let title: String
    @Binding var selectedTab: Int
    let tab: Int
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == tab ? Color.red : Color.gray)

            Text(title)
                .font(.system(size: 12))
                .foregroundColor(selectedTab == tab ? Color.red : Color.gray)
        }
        .onTapGesture {
            selectedTab = tab
        }
    }
}

#Preview {
    MainTabView()
}
