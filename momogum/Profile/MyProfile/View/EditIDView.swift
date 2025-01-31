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
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            HStack(alignment: .center){
                // back 버튼
                Button{
                    viewModel.resetUserData()
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
            
            VStack(alignment: .center){
                TextField("변경할 유저아이디 입력", text: $viewModel.draftUserID)
                    .frame(width: 328, height: 39)
                    .font(.mmg(.subheader4))
                    .padding(.leading, 12)
                
                Rectangle()
                    .frame(width: 328, height: 1)
                    .foregroundStyle(.black_2)
            }
            .padding(.horizontal, 47)
            .padding(.bottom, 344)
            .onAppear {
                viewModel.draftUserID = ""
            }
            
            HStack(spacing: 0){
                Spacer()
                Button{
                    navigationPath.removeLast(1)
                }label:{
                    Text("완료")
                        .font(.mmg(.subheader3))
                    .foregroundStyle(Color.black_4)}
            }
            .padding(.trailing, 62.5)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
    }
}
