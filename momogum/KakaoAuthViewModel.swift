//
//  KakaoAuthViewModel.swift
//  momogum
//
//  Created by 서재민 on 1/15/25.
//

import Foundation
import Combine
import KakaoSDKUser
class KakaoAuthViewModel : ObservableObject {
    
    func handleKakaoLogout(){
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    
    
    //사용자의 앱에 카카오톡이 설치되어있는지 여부
    func handleKakaoLogin(){
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        } else{ //설치되어있지 않을 때
            // 카카오 웹뷰로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        // 성공 시 동작 구현
                        _ = oauthToken
                    }
                }
        }
    }
}
