//
//  AuthenticationView.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

struct SignupStep1View: View {
   //MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
//    @Environment(SignupViewModel.self) var signupViewModel
    
    @FocusState private var isFocused: Bool // TextField의 포커스 상태
    
    //MARK: - View
    var body: some View {
//        @Bindable var signupViewModel = signupViewModel

        SignupBackgroundView{
            VStack{

                
                HStack(spacing: 3){
                    Text("STEP 1")
                        .font(.system(size:16))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.momogumRed)
                    
                    Text("/ 2")
                        .font(.system(size:16))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.gray)
                }
                .padding(.top,43)
                .padding(.leading,38)
                .frame(maxWidth: .infinity,alignment: .leading)
                Text("이름을 입력해주세요")
                    .padding(.top,39)
                    .fontWeight(.semibold)
                    .font(.system(size:24))
                    .padding(.leading,43)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("머머금에서 사용할 이름을 정해주세요:)")
                    .fontWeight(.regular)
                    .foregroundStyle(Color.signupDescriptionGray)
                    .font(.system(size:16))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top,7)
                    .padding(.leading,43)
                
                
                VStack{
                    HStack{
                        TextField("머머금", text: .constant(""))
                            .modifier(SignupTextfieldModifer())
                            .focused($isFocused)
                            .foregroundStyle(isFocused ? Color.black : Color.signupDescriptionGray)
                        Text("(최대12자)")
                            .padding(.top,142)
                            .padding(.trailing,32)
                    }
                    // Divider의 색상을 TextField 상태에 따라 변경
                    Divider()
                        .frame(height: 2)
                        .background(isFocused ? Color.black : Color.placeholderGray2)
                        .padding(.horizontal,32)
                    
                    Text("한글, 영어소문자,영어 대문자 사용가능")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,43)
                        .font(.system(size:16))
                        .fontWeight(.regular)
                }
                
                
                NavigationLink{
                    SignupStep2View()
                }label: {
                    Text("다음")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.trailing, 49)
                .offset(y:200)
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label:{
                        Image(systemName:"xmark")
                            .tint(Color.black)
                    }
                }
            }
        }
    }
    
}

#Preview {
    SignupStep1View()
}
