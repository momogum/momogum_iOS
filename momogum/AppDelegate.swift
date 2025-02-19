////
////  AppDelegate.swift
////  momogum
////
////  Created by 서재민 on 1/14/25.
////
//
//import Foundation
//import UIKit
//import KakaoSDKCommon
//import KakaoSDKAuth
//import Firebase
//import UserNotifications
//import FirebaseCore
//import FirebaseMessaging
//import FirebaseInAppMessaging
//
//class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//        
//        print("kakaoAppkey : \(kakaoAppKey)")
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//        FirebaseApp.configure()
//        
//        
//        //  In-App Messaging 활성화
//        InAppMessaging.inAppMessaging().messageDisplaySuppressed = true
//        // 푸시 알림 권한 요청
//            requestNotificationAuthorization(application)
//        
//        //FCM 토큰 받기
//        Messaging.messaging().delegate = self
//
//        
//        
//        return true
//    }
//    // ✅ FCM 등록 토큰 받기 (Firebase가 이 메서드를 감지하도록 수정)
//       func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//           guard let fcmToken = fcmToken else {
//               print("❌ FCM 등록 토큰을 받지 못함")
//               return
//           }
//           print("✅ FCM 등록 토큰: \(fcmToken)")
//           
//           // 🔹 서버로 FCM 토큰 전송 가능
//           let dataDict: [String: String] = ["token": fcmToken]
//           NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
//       }
//    
//    //푸시 알림 권한 요청 및 등록
//    private func requestNotificationAuthorization(_ application: UIApplication) {
//            let center = UNUserNotificationCenter.current()
//            center.delegate = self
//            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//                if let error = error {
//                    print("❌ 알림 권한 요청 실패: \(error.localizedDescription)")
//                    return
//                }
//                DispatchQueue.main.async {
//                    application.registerForRemoteNotifications()
//                }
//            }
//        }
//    
//    // APNs 토큰을 FCM에 등록
//        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//            Messaging.messaging().apnsToken = deviceToken
//            print("📲 APNs Device Token: \(deviceToken.map { String(format: "%02.2hhx", $0) }.joined())")
//        }
//        
//    // 앱이 포그라운드 상태에서 푸시 알림을 받을 때
//        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//            completionHandler([.banner, .sound, .badge])
//        }
//        
//    // 사용자가 알림을 탭했을 때
//       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//           let userInfo = response.notification.request.content.userInfo
//           print("📩 알림 데이터: \(userInfo)")
//           completionHandler()
//       }
//    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        if (AuthApi.isKakaoTalkLoginUrl(url)) {
//            return AuthController.handleOpenUrl(url: url)  // url을 타는 코드
//        }
//
//        return false
//    }
//    
//    
//    //scenedelegate 연결
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        
//        let sceneConfiguration = UISceneConfiguration(name : nil, sessionRole: connectingSceneSession.role)
//        
//        sceneConfiguration.delegateClass = SceneDelegate.self
//        
//        return sceneConfiguration
//    }
//    
//    
//    
//}
import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import Firebase
import UserNotifications
import FirebaseCore
import FirebaseMessaging
import FirebaseInAppMessaging

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        print("kakaoAppkey : \(kakaoAppKey)")
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        FirebaseApp.configure()
        

        //  In-App Messaging 활성화
        InAppMessaging.inAppMessaging().messageDisplaySuppressed = true
        // 푸시 알림 권한 요청
        requestNotificationAuthorization(application)
        
        //FCM 토큰 받기
        Messaging.messaging().delegate = self
        
        
        
        return true
    }
    
    
    
    
    // ✅ FCM 등록 토큰 받기 (Firebase가 이 메서드를 감지하도록 수정) ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken = fcmToken else {
            print("❌ FCM 등록 토큰을 받지 못함")
            return
        }
        print("✅ FCM 등록 토큰 2222: \(fcmToken)")
        
        // 🔹 서버로 FCM 토큰 전송 가능
        let dataDict: [String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
    
    
    
    //푸시 알림 권한 요청 및 등록
    private func requestNotificationAuthorization(_ application: UIApplication) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("❌ 알림 권한 요청 실패: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }
    
    // APNs 토큰을 FCM에 등록
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("📲 APNs Device Token: \(tokenString)")

        // ✅ FirebaseMessaging에 APNs 토큰 설정
        Messaging.messaging().apnsToken = deviceToken
    }

    func fetchFCMToken() {
           Messaging.messaging().token { token, error in
               if let error = error {
                   print("❌ FCM 토큰 가져오기 실패: \(error.localizedDescription)")
               } else if let token = token {
                   print("✅ FCM 등록 토큰11111: \(token)")
               }
           }
       }
   
    
    // ❌ APNs 등록 실패 시 로그 출력
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("❌ APNs 등록 실패: \(error.localizedDescription)")
    }
    
    // 앱이 포그라운드 상태에서 푸시 알림을 받을 때
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    // 사용자가 알림을 탭했을 때
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("📩 알림 데이터: \(userInfo)")
        completionHandler()
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)  // url을 타는 코드
        }
        
        return false
    }
}
