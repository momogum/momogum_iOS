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
    @State private var inputText: String = ""

    @FocusState private var isFocused: Bool // TextField의 포커스 상태
    
    @State private var showError: Bool = false // 에러 메시지 표시 여부
    @Binding var path: [String]
    
    
    //MARK: - View
    var body: some View {
//        @Bindable var signupViewModel = signupViewModel
        HStack{
            Button {
                path = []
            }label:{
                Image(systemName: "xmark")
            }
            .foregroundStyle(Color.black)
            .padding(.leading, 28)
            .frame(width: 24, height: 24)
            
            Text("정보 입력")
                .font(.system(size:20))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .top)
                .padding(.leading, 107)
                .padding(.trailing,159)
                .padding(.bottom,5)
            
        }
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
                } // Step1/2
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
                        TextField("머머금", text: $inputText,onEditingChanged: { editing in
                            if editing {
                                isFocused = true
                            }

                        })
                            .modifier(SignupTextfieldModifer())
                            .focused($isFocused)
                            .foregroundStyle(isFocused ? Color.black : Color.placeholderGray3)
                            .onChange(of: inputText) { _, newValue in
                                // 입력 값 길이 제한
                                if isFocused && newValue.count > 1 {
                                    showError = !validateInput(inputText) || newValue.count > 12
                                }
                           }
                        
                        Text("(최대12자)")
                            .padding(.top,142)
                            .padding(.trailing,32)
                        
                        
                    }
                    // Divider의 색상을 TextField 상태에 따라 변경
                    Divider()
                        .frame(height: 2)
                        .background(isFocused ? Color.black : Color.placeholderGray3)
                        .padding(.horizontal,32)
                    
                    Text("한글, 영어소문자,영어 대문자 사용가능")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,43)
                        .font(.system(size:16))
                        .fontWeight(.regular)
                    
                    
                    if showError && isFocused && !validateInput(inputText) {
                        Text("잘못된 입력이에요")
                            .foregroundColor(.red)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,43)
                    }
                    else if !showError && isFocused && validateInput(inputText)  {
                        Text("사용 가능한 이름이에요.")
                            .foregroundColor(.green)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,43)
                        
                        
                    }

                }
                Spacer()

                NavigationLink(value: "SignupStep2View"){
                    Text("다음")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .navigationDestination(for: String.self) { value in
                    if value == "SignupStep2View" {
                        SignupStep2View(path: $path)
                    }
                }
                .padding(.trailing, 49)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom ,93)
                .disabled(showError || !validateInput(inputText))
                .foregroundStyle(showError || !isFocused || !validateInput(inputText) ? .gray : . momogumRed)
                
            }
            .navigationBarBackButtonHidden()

        }
    }
    // 입력 값 검증 함수
    func validateInput(_ text: String) -> Bool {
        let regex = "^[가-힣a-zA-Z]+$" // 한글과 영어 대소문자만 허용
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }

}

#Preview {
    SignupStep1View(path: .constant([]))
}
