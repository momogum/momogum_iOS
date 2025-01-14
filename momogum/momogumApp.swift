//
//  momogumApp.swift
//  momogum
//
//  Created by nelime on 1/6/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct momogumApp: App {
  
    @UIApplicationDelegateAdaptor var appDelegate : AppDelegate
    
//    init() {
//
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? "" //없을 땐 빈칸
//
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

