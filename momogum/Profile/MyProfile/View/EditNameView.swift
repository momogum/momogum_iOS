//
//  EditNameView.swift
//  momogum
//
//  Created by 류한비 on 1/31/25.
//

import SwiftUI

struct EditNameView: View {
    @Binding var navigationPath: NavigationPath
    @Bindable var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0){
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
                .padding(.trailing, 103)
                
                Text("이름 변경")
                    .font(.mmg(.subheader3))
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            .padding(.top, 77)
            .padding(.horizontal, 30)
            .padding(.bottom, 102)
            
            VStack(alignment: .leading, spacing: 0){
                Text("변경할 이름을 입력해주세요")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.bottom, 12)
                
                Text("12자 이내의 한글, 영문 사용 가능해요:)")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black_3)
                    .padding(.leading, 3)
            }
            .padding(.bottom, 68)
            .padding(.trailing, 74)
            
            VStack(alignment: .center){
                TextField("변경할 이름 입력", text: $viewModel.draftUserName)
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
                viewModel.draftUserName = ""
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
