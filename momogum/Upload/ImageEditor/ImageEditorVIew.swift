//
//  ImageEditorView.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//
import SwiftUI

struct ImageEditorView: View {
    var image: UIImage

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.title2)
                }

                Spacer()

                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.title2)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 60)
            .background(Color.white)

            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .padding()

            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ImageEditorView(image: UIImage(systemName: "photo") ?? UIImage())
}
