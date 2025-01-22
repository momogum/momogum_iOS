//
//  ContentView.swift
//  momogum
//
//  Created by nelime on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMainView = false
    var body: some View {
        ZStack{
            if showMainView{
                
//                LoginView()
                MainTabView()
                
            } else{
                SplashView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation{
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}
#Preview {
    ContentView()
}
