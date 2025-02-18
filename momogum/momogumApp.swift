//
//  momogumApp.swift
//  momogum
//
//  Created by nelime on 1/6/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import FirebaseCore

class FirebaseAppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct momogumApp: App {
  
    @UIApplicationDelegateAdaptor var appDelegate : FirebaseAppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
//            MainTabView()
        }
    }
}

