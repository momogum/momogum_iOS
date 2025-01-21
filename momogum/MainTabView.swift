//
//  MainTabView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//


import SwiftUI

struct MainTabVIew: View {
    @State var tabIndex = 0
    
    //     UITabView 색상 초기화
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }
    
    var body: some View {
        TabView(selection: $tabIndex) {
            HomeView(tabIndex: $tabIndex)
                .tabItem{
                    Image(systemName: "house")
                    Text("홈")
                }
                .tag(0)
            GalleryPickerView()
                .tabItem{
                    Image(systemName: "plus")
                    Text("업로드")
                }
                .tag(1)
            AppointView(tabIndex: $tabIndex)
                .tabItem{
                    Image(systemName: "calendar")
                    Text("약속관리")
                }
                .tag(2)
            Text("Search")
                .tabItem{
                    Image(systemName: "person")
                    Text("내프로필")
                }
                .tag(3)
            
        }
    }
}

#Preview {
    MainTabVIew()
}

