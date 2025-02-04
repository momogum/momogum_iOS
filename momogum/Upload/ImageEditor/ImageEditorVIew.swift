//
//  ImageEditorView.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import SwiftUI

struct ImageEditorView: View {
    @StateObject private var viewModel: ImageEditorViewModel
    @Environment(\.dismiss) var dismiss
    @State private var navigationPath = NavigationPath()
    @Binding var isTabBarHidden: Bool
    @Binding var tabIndex: Int

    init(image: UIImage, tabIndex: Binding<Int>, isTabBarHidden: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: ImageEditorViewModel(image: image))
        _tabIndex = tabIndex
        _isTabBarHidden = isTabBarHidden
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color.white.ignoresSafeArea()

                GeometryReader { geometry in
                    let screenWidth = geometry.size.width
                    let frameSize = screenWidth

                    ZStack {
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: frameSize * viewModel.scale,
                                height: frameSize * viewModel.scale / viewModel.image.size.width * viewModel.image.size.height
                            )
                            .clipped()
                            .offset(viewModel.offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        viewModel.updateOffset(gesture.translation, frameSize: frameSize)
                                    }
                            )
                            .simultaneousGesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        viewModel.updateScale(viewModel.scale * value, frameSize: frameSize)
                                    }
                            )
                    }
                    .frame(width: frameSize, height: frameSize)
                    .clipped()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)

                    VStack {
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            .frame(width: 44, height: 44)

                            Spacer()

                            Button(action: {
                                dismiss()
                                tabIndex = 0
                                isTabBarHidden = false
                                viewModel.resetToOriginalImage()
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            .frame(width: 44, height: 44)
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 60)

                        Spacer()

                        Button(action: {
                            if let editedImage = viewModel.finalizeImage(frameSize: frameSize) {
                                viewModel.image = editedImage
                                navigationPath.append(EditedImageModel(image: editedImage))
                            }
                        }) {
                            Text("다음")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 100)
                                .background(Color.momogumRed)
                                .cornerRadius(8)
                        }
                        .padding(.bottom, 32)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 24)
                    }
                    .zIndex(1)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear {
                isTabBarHidden = true
                UITabBar.appearance().isHidden = true
            }
            .onDisappear {
                if tabIndex == 0 {
                    isTabBarHidden = false
                    UITabBar.appearance().isHidden = false
                }
            }
            .navigationDestination(for: EditedImageModel.self) { editedImage in
                NewPostView(
                    editedImage: editedImage.image,
                    onReset: {
                        viewModel.resetToOriginalImage()
                    }
                )
            }
        }
    }
}

#Preview {
    ImageEditorView(image: UIImage(systemName: "photo") ?? UIImage(), tabIndex: .constant(0), isTabBarHidden: .constant(false))
}
