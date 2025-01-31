//
//  MainTabView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//


import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 0
    @State private var uploadViewID = UUID()
    
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
            GalleryPickerView(tabIndex: $tabIndex)
                .id(uploadViewID)
                .tabItem{
                    Image(systemName: "plus")
                    Text("업로드")
                }
                .tag(1)
            AppointView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("약속관리")
                }
                .tag(2)
            MyProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("내프로필")
                }
                .tag(3)
            
        }
        .tint(Color(UIColor(red: 224/255, green: 90/255, blue: 85/255, alpha: 1.0)))
        
        .onChange(of: tabIndex) { newTab in
                    if newTab == 1 {
                        uploadViewID = UUID()
                    }
                }
    }
}

#Preview {
    MainTabView()
}

