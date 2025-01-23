//
//  AppointCreate3View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

/// 약속생성의 3단계, 모임이름(appointName), 식사메뉴(menuName), 식사일정(pickedDate), 식사장소(placeName), 특별소식(note) 적는 뷰
struct AppointCreate3View: View {
    @Environment(\.dismiss) var dismiss
    @Environment(NewAppointViewModel.self) var appointViewModel
    
    @Binding var path: [String]

    var body: some View {
        @Bindable var viewModel = appointViewModel
        
        VStack {
            Spacer()
            
            Text("식사 모임 이름을 알려주세요")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 더술 출발, 돈까스 먹장...", text: $viewModel.appointName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                        
            Text("식사 메뉴를 알려주세요")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 더술 닭한마리, 투파피 파스타", text: $viewModel.menuName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                Text("식사 일정을 알려주세요")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            DatePicker("", selection: $viewModel.pickedDate)
                .labelsHidden()
                .datePickerStyle(.automatic)
                .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))
            
            
            Text("어디서 만날까요?")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 중앙동 다이소 앞, 학교 쪽문 앞", text: $viewModel.placeName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
            Text("특별한 소식이 있나요?")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 꾸밈단계 2단계", text: $viewModel.note)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink(value: "create4") {
                    Text("다음")
                        .fontWeight(.bold)
                        .frame(width: 90, height: 40)
                        .background(.black.opacity(0.7))
                        .foregroundStyle(.white)
                        .clipShape(Rectangle())
                        .padding(.trailing, 30)
                }
            }
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
                    Image(systemName: "chevron.backward")
                        .tint(.black)
                }
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    path.removeLast(path.count)
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    AppointCreate3View(path: AppointView().$path)
        .environment(NewAppointViewModel())
}
