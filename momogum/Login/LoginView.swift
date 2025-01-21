//
//  SwiftUIView.swift
//  momogum
//
//  Created by 서재민 on 1/11/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var kakaoAuthViewModel : KakaoAuthViewModel = KakaoAuthViewModel()
    @FocusState private var isFocused: Bool // TextField의 포커스 상태
    @FocusState private var isFocusedPWD: Bool 
    var body: some View {
        
        NavigationStack{
            Image("Momogum")
                .resizable()
                .frame(width: 112, height: 112)
                .padding(.horizontal,126)
                .padding(.top, 100)
                .padding(.bottom, 30)
            Spacer()

            Button{
                KakaoAuthViewModel().handleKakaoLogout()
                print("카카오 로그아웃 성공") // 로그인 성공시 메인탭뷰로 넘어가게
            }
            label: {
                Text("카카오 로그아웃")
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 58)
                    .foregroundStyle(.white)
                    .background(Color.momogumRed)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
           
            Button{
                KakaoAuthViewModel().handleKakaoLogin()
                //만약 카카오 최초로그인이라면, SignupStep1View로 넘긴다
            }
            label: {
                Image("KakaoLogin")
            }
            
            //회원가입뷰
            NavigationLink{
                SignupStep1View()
            }label: {
                HStack(spacing: 0) {
                    Text("계정이 없으신가요? ")
                        .foregroundColor(.primary) // 기본 색상
                    Text("회원가입하기")
                        .foregroundColor(Color.momogumRed) // 강조된 색상
                        .fontWeight(.bold) // 굵게 설정
                }
                .foregroundStyle(.black)
                .background{
                    
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
    
}

#Preview {
    LoginView()
}
