//
//  SignupStep2View.swift
//  momogum
//
//  Created by 서재민 on 1/12/25.
//

import SwiftUI

struct SignupStep2View: View {
    //MARK: - Properties
    @Environment(\.dismiss) var dismiss
//    @Environment(SignupViewModel.self) var signupViewModel
    @FocusState private var isFocused: Bool
    
    //MARK: - View
    var body: some View {
        SignupBackgroundView{
            VStack{
                HStack(spacing: 3){
                    Text("STEP 2")
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
                
                Text("머머금에서 사용할 아이디를 입력해주세요")
                    .padding(.top,39)
                    .fontWeight(.semibold)
                    .font(.system(size:24))
                    .padding(.leading,43)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
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
                    
                    Text("최소 5자~ 20자")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,43)
                        .font(.system(size:16))
                        .fontWeight(.regular)
                    Text("영어소문자,숫자,'.','_'사용가능")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,43)
                        .font(.system(size:16))
                        .fontWeight(.regular)
                }
                Spacer()
                HStack{
                    Button{
                        dismiss()
                    } label:{
                        Text("이전단계")
                            .tint(Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 93)
                    .padding(.leading, 43)
                    .foregroundStyle(Color.placeholderGray)
                    NavigationLink{
                        EmptyView() //maintap들어갈예정
                    }label: {
                        Text("완료")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundStyle(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.trailing, 47)
                    .padding(.bottom, 93)
                }
            }
            .navigationBarBackButtonHidden()

        }
        
    }
}

#Preview {
    SignupStep2View()
}
