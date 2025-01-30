//
//  AppointCreate4View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

/// 약속생성의 4단계, 초대장 생성 직전 마지막 편집하는 뷰
struct AppointCreate4View: View {
    @Environment(\.dismiss) var dismiss
    @Environment(NewAppointViewModel.self) var appointViewModel
    
    @Binding var path: [String]
    
    let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일 HH:mm"
        formatter.locale = Locale(identifier: "ko-KR")
        return formatter
    }
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        ScrollView {
            VStack {
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
                        .offset(x: -60, y: 0)
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.gray)
                        .overlay {
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 2))
                                .foregroundStyle(.black)
                        }
                        .offset(x: -30, y: 0)
                    
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
                        .offset(x: 60, y: 0)
                }
                
                Rectangle()
                    .frame(width: 170, height: 120)
                    .foregroundStyle(.gray.opacity(0.2))
                    .padding(.vertical, 30)
                
                
                
                VStack (spacing: 0) {
                    Text("식사 모임명")
                        .font(.mmg(.Body3))
                        .foregroundStyle(.black_2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ApmEditingTextFieldView(target: $viewModel.appointName)
                    
                    Text("식사 메뉴")
                        .font(.mmg(.Body3))
                        .foregroundStyle(.black_2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    
                    ApmEditingTextFieldView(target: $viewModel.menuName)
                    
                    Text("식사 일정")
                        .font(.mmg(.Body3))
                        .foregroundStyle(.black_2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack {
                        Text("\(viewModel.pickedDate, formatter: dateFormatter())")
                            .modifier(ApmTextFieldModifier())
                        HStack {
                            Spacer()
                            Button {
                                print()
                            } label: {
                                Image("pencil")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.trailing, 10)
                        }

                        
                    }
                    
                    
                    Text("만나는 장소")
                        .font(.mmg(.Body3))
                        .foregroundStyle(.black_2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ApmEditingTextFieldView(target: $viewModel.placeName)
                    
                    Text("추가 메모")
                        .font(.mmg(.Body3))
                        .foregroundStyle(.black_2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ApmEditingTextFieldView(target: $viewModel.note)
                    
                    Button {
                        viewModel.createAppoint()
                        path.append("Sent")
                    } label: {
                        Text("초대장 보내기")
                            .font(.mmg(.subheader3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(.Red_2)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 30)
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("약속잡기")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 5)
                            .foregroundStyle(.black)
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.resetAppoint()
                        path.removeLast(path.count)
                    } label: {
                        Image("close")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 5)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AppointCreate4View(path: AppointView().$path)
        .environment(NewAppointViewModel())

}
