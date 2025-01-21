//
//  SearchView.swift
//  momogum
//
//  Created by 김윤진 on 1/21/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery: String = ""
    @State private var isEditing: Bool = false // 텍스트 필드 편집 상태를 추적
    @State private var selectedButton: String = "계정" // 초기 선택된 버튼
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능을 위해 사용
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    // 텍스트 필드 왼쪽의 검색 아이콘
                    if !isEditing {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    }
                    
                    // 텍스트 필드
                    TextField("계정 및 키워드 검색", text: $searchQuery, onEditingChanged: { editing in
                        isEditing = editing // 편집 상태 업데이트
                    })
                    .foregroundColor(.primary)
                    .padding(8)
                    
                    // 텍스트 필드 오른쪽 끝에 표시할 'close_cc' 이미지
                    if isEditing {
                        Button(action: {
                            searchQuery = "" // 입력 초기화
                            isEditing = false // 편집 상태 종료
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // 키보드 닫기
                        }) {
                            Image("close_cc") // 커스텀 이미지
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                                .padding(.trailing, 8)
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                )
                .padding(.horizontal, 16)
                
                // 텍스트 필드 하단에 회색 구분선 추가
                Divider()
                    .background(Color.gray)
                    .padding(.top, 20)
                
                // 버튼들 (계정, 키워드)
                HStack(spacing: 48) { // 버튼 간격 설정
                    Button(action: {
                        selectedButton = "계정"
                    }) {
                        VStack {
                            Text("계정")
                                .fontWeight(selectedButton == "계정" ? .bold : .regular)
                                .foregroundColor(selectedButton == "계정" ? .black : .gray)
                                .frame(width: 140, height: 48) // 버튼 크기 설정
                            
                            // 언더바
                            Rectangle()
                                .fill(selectedButton == "계정" ? Color.black : Color.gray)
                                .frame(height: 2)
                                .padding(.top, 2)
                        }
                    }
                    
                    Button(action: {
                        selectedButton = "키워드"
                    }) {
                        VStack {
                            Text("키워드")
                                .fontWeight(selectedButton == "키워드" ? .bold : .regular)
                                .foregroundColor(selectedButton == "키워드" ? .black : .gray)
                                .frame(width: 140, height: 48) // 버튼 크기 설정
                            
                            // 언더바
                            Rectangle()
                                .fill(selectedButton == "키워드" ? Color.black : Color.gray)
                                .frame(height: 2)
                                .padding(.top, 2)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 0) { // 쉐브론과 텍스트를 배치
                    // 쉐브론 아이콘
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                        .frame(width: 130) // 쉐브론과 텍스트 간격
                    
                    // "검색하기" 텍스트
                    Text("검색하기")
                        .font(.system(size: 18, weight: .bold)) // 텍스트 크기 및 굵기
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
