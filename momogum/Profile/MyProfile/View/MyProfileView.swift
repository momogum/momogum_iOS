//
//  MyProfileView.swift
//  momogum
//
//  Created by 류한비 on 1/18/25.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .center){
                    
                    Spacer()
                    
                    // 내 유저 아이디
                    Text("내 유저 아이디")
                        .frame(width: .infinity, height: 20)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // 설정 버튼
                    Image("settings")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 31)
                .padding(.bottom, 20)
                
                HStack{
                    // 프로필 이미지
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 76, height: 76)
                        .clipShape(Circle())
                        .padding(5)
                        .overlay(
                            Circle()
                                .stroke(Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255), lineWidth: 4) // 회색 테두리 추가
                        )
                        .padding(.trailing, 35)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            // 이름
                            Text("이름")
                                .frame(width: .infinity,height: 16, alignment: .leading)
                                .fontWeight(.semibold)
                            
                            Text("한 줄 소개")
                                .frame(width:.infinity,height: 12, alignment: .leading)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                        }
                        .padding(.bottom, 16)
                        
                        // 팔로워, 팔로잉
                        HStack{
                            Button(action: {
                                print("팔로워 버튼 클릭")
                            }) {
                                Text("팔로워 17")
                                    .frame(width:.infinity, height: 13, alignment: .leading)
                                    .fontWeight(.semibold)
                                    .padding(.trailing, 43)
                                    .foregroundStyle(Color.black)
                            }
                            
                            Button(action: {
                                print("팔로잉 버튼 클릭")
                            }) {
                                Text("팔로잉 14")
                                    .frame(width:.infinity, height: 13, alignment: .leading)
                                    .fontWeight(.semibold)
                                    .padding(.trailing, 43)
                                    .foregroundStyle(Color.black)
                            }
                            
                        }
                        
                    }
                }
            }
            
            // 프로필 편집 버튼
            NavigationLink{
                
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 315, height: 36)
                    .foregroundStyle(Color(red: 235 / 255, green: 232 / 255, blue: 232 / 255))
                    .overlay(
                        Text("프로필 편집")
                            .frame(height: 10)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundStyle(.black)
                    )
                    .padding(.top, 45)
                    .padding(.bottom, 20)
            }
            
            Divider()
            
            
        }
    }
}


#Preview {
    MyProfileView()
}
