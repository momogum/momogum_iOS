//
//  MyFollower.swift
//  momogum
//
//  Created by 류한비 on 1/19/25.
//

import SwiftUI

struct MyFollower: View {
    @State private var search: String = ""
    @State private var showCloseButton = false
    @State private var isEditing = false // 텍스트필드 활성화 여부
    
    var body: some View {
        VStack{
            List{
                ZStack{
                    HStack(alignment: .center, spacing: 0) {
                        
                        Spacer()
                        
                        //검색바
                        TextField("닉네임 or 유저아이디로 검색", text: $search,
                                  onEditingChanged: { editing in
                            isEditing = editing
                            showCloseButton = editing
                        })
                        .padding(.leading, isEditing ? 0 : 43)
                        .padding(.horizontal, 23)
                        .frame(width: 353, height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black_5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 235 / 255, green: 232 / 255, blue: 232 / 255), lineWidth: 1)
                        )
                        .font(.mmg(.subheader4))
                        .foregroundStyle(isEditing ? Color.black_1 : Color.black_4)
                        .onChange(of: search) {
                            showCloseButton = true
                        }
                        .onSubmit { // 엔터 입력 후
                            // 검색창이 비어있으면 돋보기 보임
                            isEditing = search.isEmpty ? false : true
                            showCloseButton = false
                        }
                        
                        Spacer()
                        
                    }
                    
                    // 텍스트 필드 활성화 전
                    if !isEditing {
                        HStack(alignment: .center, spacing: 0){
                            Image("search")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.leading, 45)
                            
                            Spacer()
                        }
                    }
                    
                    if showCloseButton {
                        HStack{
                            Spacer()
                            Button{
                                search = ""
                                showCloseButton = false
                            }label:{
                                Image("close_black3")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.trailing, 42)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 36)
                
                // 팔로워 목록
                ForEach(0..<20){_ in
                    FollowerCell()
                        .listRowSeparator(.hidden)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    MyFollower()
}
