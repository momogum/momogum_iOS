//
//  MyCardView.swift
//  momogum
//
//  Created by 조승연 on 2/1/25.
//

import SwiftUI

struct MyCardView: View {
    @StateObject private var viewModel = MyCardViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .frame(width: 44, height: 44)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.togglePopup()
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)
                .frame(height: 60)
                .background(Color.white)
            }
            .zIndex(1)

            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Spacer().frame(height: 70)

                    UserInfoView()
                        .padding(.leading, 22)
                    
                    Spacer().frame(height: 10)

                    ZStack {
                        Image("cardExample")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)

                        if viewModel.myCard.showBookmark {
                            Text("저장됨")
                                .font(.system(size: 16))
                                .foregroundColor(.red)
                                .frame(width: 134, height: 46)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 2)
                                )
                                .transition(.opacity)
                                .position(x: UIScreen.main.bounds.width / 2, y: 200)
                        }
                    }

                    Spacer().frame(height: 5)
                    
                    HStack {
                        Spacer().frame(width: 10)
                        HeartView(likeCount: $viewModel.myCard.likeCount)
                            .fixedSize()
                        Spacer().frame(width: 20)
                        CommentView()
                        Spacer()
                        BookmarkView(showBookmark: $viewModel.myCard.showBookmark)
                        Spacer().frame(width: 10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                    Spacer().frame(height: 5)

                    Text("\(viewModel.myCard.likeCount)명이 이 밥일기를 좋아합니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .padding(.leading, 28)
                        .padding(.top, 5)
                        .opacity(viewModel.myCard.likeCount > 0 ? 1 : 0)
                        .frame(height: 20)
                    
                    Spacer().frame(height: 5)

                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image("map")
                                .resizable()
                                .frame(width: 10, height: 13)
                                .padding(.trailing, 5)
                            
                            Text("식사장소")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Image("forkknife")
                                .resizable()
                                .frame(width: 12, height: 13)
                                .padding(.trailing, 5)
                            
                            Text("메뉴1, 메뉴2, 메뉴3, 메뉴4, 메뉴5")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 28)
                    .padding(.top, 5)

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 330, height: 79)

                        ScrollView {
                            Text(viewModel.myCard.reviewText)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                                .padding(.leading, 24)
                        }
                        .frame(width: 330, height: 79, alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.leading, 28)
                    .padding(.top, 30)
                }
                .padding(.bottom, 20)
            }

            if viewModel.showPopup {
                PopupMenuView(showPopup: $viewModel.showPopup)
            }

            if viewModel.showDeleted {
                Text("삭제됨")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .transition(.opacity)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyCardView()
}
