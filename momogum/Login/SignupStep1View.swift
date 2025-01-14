//
//  AuthenticationView.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

struct SignupStep1View: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        SignupBackgroundView{
            VStack{

                
                HStack(spacing: 3){
                    Text("STEP 1")
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
                
                Text("이메일을 입력해주세요")
                    .padding(.top,39)
                    .fontWeight(.semibold)
                    .font(.system(size:24))
                    .padding(.leading,43)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                TextField("이메일을 입력해주세요", text: .constant(""))
                    .modifier(SignupTextfieldModifer())
                    .padding(.bottom, 301)
                
                NavigationLink{
                    SignupStep2View()
                }label: {
                    Text("다음")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.trailing, 32)
                .padding(.bottom, 93)

            }
        }
    }
    
}

#Preview {
    SignupStep1View()
}
