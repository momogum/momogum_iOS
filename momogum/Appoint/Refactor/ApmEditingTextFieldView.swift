//
//  ApmEditingTextFieldView.swift
//  momogum
//
//  Created by nelime on 1/29/25.
//

import SwiftUI


struct ApmEditingTextFieldView: View {
    @State var isEditing = false
    @Binding var target: String
    
    var body: some View {
        if isEditing {
            TextField(target, text: $target)
                .modifier(ApmTextFieldModifier())
                .onSubmit {
                    isEditing = false
                }
        } else {
            ZStack {
                Text(target)
                    .modifier(ApmTextFieldModifier())

                
                HStack {
                    Spacer()
                    
                    Button {
                        isEditing = true
                    } label: {
                        Image("pencil")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    ApmEditingTextFieldView(target: .constant("something"))
}
