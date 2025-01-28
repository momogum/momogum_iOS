//
//  AppointCreateCompleteView.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//
//

import SwiftUI

/// 초대장 생성 이후 약속 내용을 확인하는 뷰
struct AppointCheckingView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var showCancleAlert = false
    @State var showConfirmAlert = false
    
    let appoint: Appoint
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 600)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    VStack {
                        Rectangle()
                            .frame(width: 250, height: 150)
                            .foregroundStyle(.gray.opacity(0.8))
                            .padding(20)
                        
                        HStack {
                            ZStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .overlay {
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 2))
                                            .foregroundStyle(.black)
                                    }
                                    .offset(x: 0, y: 0)
                                
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .overlay {
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 2))
                                            .foregroundStyle(.black)
                                    }
                                    .offset(x: 30, y: 0)
                                
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .overlay {
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 2))
                                            .foregroundStyle(.black)
                                    }
                                    .offset(x: 60, y: 0)
                                
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .overlay {
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 2))
                                            .foregroundStyle(.black)
                                    }
                                    .offset(x: 90, y: 0)
                                
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .background(.gray)
                                    .foregroundStyle(.white)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 2))
                                            .foregroundStyle(.black)
                                    }
                                    .offset(x: 120, y: 0)
                            }
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack {
                            Text("식사 메뉴")
                                .font(.headline)
                                .foregroundStyle(.black.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Text(appoint.menuName)
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            
                            Spacer()
                            
                            Text("식사 일정")
                                .font(.headline)
                                .foregroundStyle(.black.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(appoint.pickedDate)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            
                            Spacer()
                            
                            
                            Text("만나는 장소")
                                .font(.headline)
                                .foregroundStyle(.black.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(appoint.placeName)
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            
                            Spacer()
                            
                            
                            Text("추가 메모")
                                .font(.headline)
                                .foregroundStyle(.black.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(appoint.note ?? "")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                            
                            Spacer()
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 350)
                    }
                    .padding(.horizontal, 40)
                }
                
                HStack {
                    Button {
                        showCancleAlert = true
                    } label: {
                        Text("약속 취소")
                    }
                    .alert(Text("약속을 취소해요"), isPresented: $showCancleAlert) {
                        Button("약속 취소", role: .destructive) {
                            print("약속 취소됨요")
                        }
                    } message: {
                        Text("취소된 약속은 다시 불러올 수 없습니다.")
                    }
                    
                    
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Text("약속 확정")
                    }
                    .alert(Text("약속을 확정해요"), isPresented: $showConfirmAlert) {
                        Button("약속 확정", role: .destructive) {
                            print("약속 확정됨요")
                        }
                    } message: {
                        Text("지금까지 초대를 수락한 참가자와 약속을 확정합니다. 더 이상 다른 참가자가 초대를 수락할 수 없습니다.")
                    }
                    
                }
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(appoint.appointName)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AppointCheckingView(appoint: Appoint.DUMMY_APM)
}
