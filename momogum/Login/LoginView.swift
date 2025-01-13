//
//  SwiftUIView.swift
//  momogum
//
//  Created by 서재민 on 1/11/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        NavigationStack{
            Image("Momogum")
                .resizable()
                .frame(width: 112, height: 112)
                .padding(.horizontal,126)
                .padding(.top, 100)
                .padding(.bottom, 30)
            
            VStack{
                Text("아이디")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,7)
                
                
                TextField("아이디혹은 이메일 입력", text: .constant(""))
                    .textInputAutocapitalization(.never)
                    .padding(12)
                    .border(Color.gray, width: 1)
                    .padding(.bottom,16)
                
                
            }
            .padding(.horizontal,58)
            .padding(.bottom,7)
            
            
            VStack{
                Text("비밀번호")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,7)
                
                
                TextField("비밀번호 입력", text: .constant(""))
                    .textInputAutocapitalization(.never)
                    .padding(12)
                    .border(Color.gray, width: 1)
                    .padding(.bottom,16)
            }
            .padding(.horizontal,58)
            
            
            Button{
                print("로그인 성공") // 로그인 성공시 메인탭뷰로 넘어가게
            }
            label: {
                Text("로그인")
                    .frame(width: 296, height: 49)
                    .foregroundStyle(.white)
                    .background(Color.momogumRed)
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
