//
//  EditIDView.swift
//  momogum
//
//  Created by 류한비 on 1/31/25.
//

import SwiftUI

struct EditIDView: View {
    @Binding var navigationPath: NavigationPath
    @Bindable var viewModel: ProfileViewModel
    
    @State private var showCloseButton = false
    @State private var underBarColor: Color = Color.black_4
    @State private var isIDAvailable = false // 중복확인
    @State private var checkCircle1 = false // 최소 5자 ~ 최대 20자
    @State private var checkCircle2 = false // 영어 소문자, 숫자, 특수문자( “.”, “_”) 사용 가능
    private let maxLength = 20
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            HStack(alignment: .center){
                // back 버튼
                Button{
                    viewModel.resetUserID()
                    navigationPath.removeLast(1)
                } label: {
                    Image("close_s")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                .padding(.trailing,UIScreen.main.bounds.height <= 812 ? 64 : 77)
                .padding(.leading, 28)
                
                Text("유저아이디 변경")
                    .font(.mmg(.subheader3))
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            .padding(.top, 77)
            .padding(.trailing, 32)
            .padding(.bottom, 102)
            
            VStack(alignment: .leading, spacing: 0){
                Text("변경할 유저아이디를")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Text("입력해주세요.")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 72)
            .padding(.trailing, 136)
            
            VStack(alignment: .leading, spacing: 0){
                ZStack{
                    HStack{
                        TextField("변경할 유저아이디 입력", text: $viewModel.draftUserID)
                            .frame(width: 268, height: 39)
                            .font(.mmg(.subheader4))
                            .padding(.leading, 12)
                            .onChange(of: viewModel.draftUserID) { newValue in
                                let allowedCharacters = CharacterSet.lowercaseLetters
                                    .union(.decimalDigits) // 영문 소문자 + 숫자
                                    .union(CharacterSet(charactersIn: "._")) // 특수문자 . 과 _
                                
                                // 최소 5자, 최대 20자 확인
                                checkCircle1 = (5...20).contains(newValue.count)
                                
                                // 입력된 문자가 모두 허용된 문자 범위 내에 있는지 확인 (5자 이상부터 감지)
                                checkCircle2 = newValue.count >= 5 && newValue.unicodeScalars.allSatisfy
                                { allowedCharacters.contains($0) }
                                
                                // underBarColor
                                if newValue.count < 5 {
                                    underBarColor = Color.black_4 // 기본값
                                } else if checkCircle1 && checkCircle2 {
                                    underBarColor = Color.Green_1 // 모든 조건 만족 (성공)
                                } else {
                                    underBarColor = Color.Red_1 // 오류
                                }
                                
                                
                                showCloseButton = !newValue.isEmpty
                            }
                        Spacer().frame(width: 50, height: 39)
                    }
                    
                    if showCloseButton {
                        HStack{
                            Spacer().frame(width: 288, height: 39)
                            Button{
                                viewModel.draftUserID = ""
                                showCloseButton = false
                            }label:{
                                Image("close_cc")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        
                    }
                }
                Rectangle()
                    .frame(width: 328, height: 1)
                    .foregroundStyle(underBarColor)
                    .padding(.top, 5)
                
                if isIDAvailable == false {
                    VStack(alignment: .leading, spacing: 0){
                        HStack(spacing: 0){
                            Image(checkCircle1 ? "check_circle_green" : "check_circle")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.trailing, 8)
                            
                            Text("최소 5자 ~ 최대 20자")
                                .font(.mmg(.Caption2))
                                .foregroundStyle(Color.black_3)
                        }
                        .padding(.bottom, 12)
                        
                        HStack(spacing: 0){
                            Image(checkCircle2 ? "check_circle_green" : "check_circle")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.trailing, 8)
                            
                            Text("영어 소문자, 숫자, 특수문자( “.”, “_”) 사용 가능")
                                .font(.mmg(.Caption2))
                                .foregroundStyle(Color.black_3)
                        }
                    }
                    .padding(.top, 24)
                }
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 344)
            .onAppear {
                viewModel.draftUserID = ""
            }
            
            HStack(spacing: 0){
                Spacer()
                Button{
                    if checkCircle1 && checkCircle2 == true{
                        navigationPath.removeLast(1)
                    }
                }label:{
                    Text("중복확인")
                        .font(.mmg(.subheader3))
                        .foregroundStyle(
                            checkCircle1 && checkCircle2 == true ? Color.Red_2 : Color.black_4)
                }
            }
            .padding(.trailing, 62.5)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
    }
}
