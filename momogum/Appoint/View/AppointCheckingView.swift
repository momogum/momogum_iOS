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
    
    let dateFormatter = {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy년 M월 d일 HH:mm"
        fmt.locale = Locale(identifier: "ko-KR")
        return fmt
    }
    
    var body: some View {
        VStack {
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
                
                VStack (spacing: 10) {
                    Text("식사 메뉴")
                        .font(.mmg(.Body3))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    
                    Text(appoint.menuName)
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text("식사 일정")
                        .font(.mmg(.Body3))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)

                    
                    Text("\(appoint.pickedDate, formatter: dateFormatter())")
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    Text("만나는 장소")
                        .font(.mmg(.Body3))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)

                    
                    Text(appoint.placeName)
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    Text("추가 메모")
                        .font(.mmg(.Body3))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)

                    
                    Text(appoint.note ?? "")
                        .font(.mmg(.subheader4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 350)
            }
            .padding(.horizontal, 20)
            .background(.black_5)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            HStack {
                Button {
                    showCancleAlert = true
                } label: {
                    Text("약속 취소")
                        .font(.mmg(.subheader3))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                        }
                        .foregroundStyle(.black_3)
                }
                .alert(Text("약속을 취소해요"), isPresented: $showCancleAlert) {
                    Button("약속 취소", role: .destructive) {
                        print("약속 취소됨요")
                    }
                } message: {
                    Text("취소된 약속은 다시 불러올 수 없습니다.")
                }
                
                Spacer()
                    .frame(width: 25)
                
                Button {
                    showConfirmAlert = true
                } label: {
                    Text("약속 확정")
                        .font(.mmg(.subheader3))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                        }
                        .foregroundStyle(.Red_2)
                }
                .alert(Text("약속을 확정해요"), isPresented: $showConfirmAlert) {
                    Button("약속 확정", role: .destructive) {
                        print("약속 확정됨요")
                    }
                } message: {
                    Text("지금까지 초대를 수락한 참가자와 약속을 확정합니다. 더 이상 다른 참가자가 초대를 수락할 수 없습니다.")
                }
                
            }
            .padding(.vertical, 20)
        }
        .padding(20)

        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(appoint.appointName)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 5)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    AppointCheckingView(appoint: Appoint.DUMMY_APM)
}
