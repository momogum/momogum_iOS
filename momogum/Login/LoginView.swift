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
            
            VStack{
                Text("ID *")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,11)
                
                
                TextField("아이디혹은 이메일 입력", text: .constant(""))
                    .fontWeight(.semibold)
                    .foregroundStyle((isFocused ? Color.black : Color.placeholderGray2))
                    .font(.system(size: 16))
                    .textInputAutocapitalization(.never)
                    .padding(.bottom,15)
                   .padding(.leading,11)
                    .keyboardType(.emailAddress)

                    .overlay(
                        Rectangle()
                            .frame(height: 3) // 밑줄 두께
                            .foregroundColor((isFocused ? Color.black : Color.placeholderGray2))
                            ,
                             alignment: .bottom
                    )
                    .padding(.bottom,16)
                
                
            }

            .padding(.leading,27)
            .padding(.trailing,38)
            .padding(.bottom,7)
            
            
            VStack{
                Text("password *")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,11)
                
                
                TextField("비밀번호 입력", text: .constant(""))
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .textInputAutocapitalization(.never)
                    .padding(.bottom,15)
                   .padding(.leading,11)
                    .keyboardType(.emailAddress)
                    .overlay(
                        Rectangle()
                            .frame(height: 3) // 밑줄 두께
                            .foregroundColor(Color.borderGray)
                            ,
                             alignment: .bottom
                    )
                    .padding(.bottom,16)
                
            }
            .padding(.leading,27)
            .padding(.trailing,38)
            
            Button{
                print("로그인 성공") // 로그인 성공시 메인탭뷰로 넘어가게
            }
            label: {
                Text("로그인 하기")
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 58)
                    .foregroundStyle(.white)
                    .background(Color.momogumRed)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
           
            Button{
                KakaoAuthViewModel().handleKakaoLogin()
            }
            label: {
                Text("카카오 로그인")
                    .frame(width: 340, height: 58)
                    .foregroundStyle(.white)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
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
