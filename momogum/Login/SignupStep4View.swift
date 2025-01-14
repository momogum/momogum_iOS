//
//  SignupStep4View.swift
//  momogum
//
//  Created by 서재민 on 1/13/25.
//

import SwiftUI

struct SignupStep4View: View {
    var body: some View {
        SignupBackgroundView{
            VStack{
                HStack(spacing: 3){
                    Text("STEP 4")
                        .font(.system(size:16))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.momogumRed)
                    
                    Text("/ 4")
                        .font(.system(size:16))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.gray)
                }
                .padding(.top,43)
                .padding(.leading,38)
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                Text("비밀번호를 설정해주세요")
                    .padding(.top,39)
                    .fontWeight(.semibold)
                    .font(.system(size:24))
                    .padding(.leading,43)
                    .frame(maxWidth: .infinity,alignment: .leading)

                SecureField("비밀번호", text: .constant(""))
                    .modifier(SignupTextfieldModifer())
                
                Button{
                    print("가입 성공")
                }
                label: {
                    Text("가입")
                        .frame(maxWidth: .infinity)
                        .frame(height: 58)
                        .fontWeight(.semibold)
                        .font(.system(size:20))
                        .foregroundStyle(Color.momogumRed)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.momogumRed, lineWidth: 2)
                        }
                        .padding(.horizontal,32)
                        .padding(.top,102)
                }
                
                Text("가입하면 머머금의 약관, 데이터 정책 및 쿠키 정책에 동의하게 됩니다.")
                    .font(.system(size:16))
                    .fontWeight(.regular)
                    .foregroundStyle(Color.signupDescriptionGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,71)
                    .padding(.top,2)
                
            }
        }
    }
}

#Preview {
    SignupStep4View()
}
