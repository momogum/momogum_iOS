//
//  AppointCreate4View.swift
//  momogum
//
//  Created by nelime on 1/20/25.
//

import SwiftUI

struct AppointCreate4View: View {
    @Environment(\.dismiss) var dismiss
    @Environment(NewAppointViewModel.self) var appointViewModel
    
    @Binding var path: [String]
    
    var body: some View {
        @Bindable var viewModel = appointViewModel
        
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
            .padding(.bottom)
            
            Rectangle()
                .frame(width: 170, height: 120)
                .foregroundStyle(.gray.opacity(0.2))
                .padding()
            
            TextField(viewModel.appointName, text: $viewModel.appointName)
                .padding(.leading)
                .frame(width: 180, height: 30)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                }
                
            
            
            VStack {
                Spacer()
                
                Text("식사 메뉴")
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                
                Text(viewModel.menuName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                
                Spacer()
                
                Text("식사 일정")
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(viewModel.pickedDate)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                
                Spacer()

                
                Text("만나는 장소")
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(viewModel.placeName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                
                Spacer()

                
                Text("추가 메모")
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(viewModel.note)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                
                Spacer()

                
            }
            .padding(.horizontal, 30)
            
            NavigationLink {
                AppointSentView(path: $path)
            } label: {
                Text("초대장 보내기")
                    .fontWeight(.bold)
                    .frame(width: 270, height: 40)
                    .background(.black.opacity(0.7))
                    .foregroundStyle(.white)
                    .clipShape(Rectangle())
                
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
    AppointCreate4View(path: AppointView().$path)

}
