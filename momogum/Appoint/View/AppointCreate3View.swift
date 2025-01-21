//
//  AppointCreate3View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

struct AppointCreate3View: View {
    @Environment(\.dismiss) var dismiss
    @Binding var stack: NavigationPath
    
    @State var appointName:String = ""
    @State var menuName:String = ""
//    @State var pickedDate = Date()
    @State var placeName:String = ""
    @State var specialNotation:String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("식사 모임 이름을 알려주세요")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 더술 출발, 돈까스 먹장...", text: $appointName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                        
            Text("식사 메뉴를 알려주세요")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 더술 닭한마리, 투파피 파스타", text: $menuName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                Text("식사 일정을 알려주세요")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            DatePicker("", selection: .constant(Date()))
                .labelsHidden()
                .datePickerStyle(.automatic)
                .environment(\.locale, Locale(identifier: String(Locale.preferredLanguages[0])))
            
            
            Text("어디서 만날까요?")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 중앙동 다이소 앞, 학교 쪽문 앞", text: $placeName)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
            Text("특별한 소식이 있나요?")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("ex) 꾸밈단계 2단계", text: $specialNotation)
                .padding(.leading)
                .frame(height: 40)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink {
                    AppointCreate4View()
                } label: {
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
//        .padding(.top, 50)
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
                    stack.removeLast(stack.count)
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    AppointCreate3View(stack: AppointView().$stack)
}
