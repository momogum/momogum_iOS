//
//  GalleryPickerView.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

struct GalleryPickerView: View {
    @StateObject private var viewModel = GalleryPickerViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var isTabBarHidden: Bool
    @Binding var tabIndex: Int

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let gridItems = [
                    GridItem(.flexible(), spacing: 8),
                    GridItem(.flexible(), spacing: 8),
                    GridItem(.flexible(), spacing: 8)
                ]
                let gridItemSize = (geometry.size.width - 48) / 3

                ZStack(alignment: .top) {
                    if viewModel.isPermissionGranted {
                        ScrollView {
                            LazyVGrid(columns: gridItems, spacing: 8) {
                                imageGrid(gridItemSize: gridItemSize)
                            }
                            .padding(.top, 80)
                            .padding(.horizontal, 16)
                        }
                    } else {
                        Text("사진 권한이 필요합니다. 설정에서 권한을 허용해주세요.")
                            .multilineTextAlignment(.center)
                            .padding()
                    }

                    VStack {
                        HStack {
                            Button(action: {
                                tabIndex = 0
                                isTabBarHidden = false
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            .frame(width: 44, height: 44)

                            Text("사진 선택")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading, -50)
                                .frame(maxWidth: .infinity, alignment: .center)

                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 60)
                        .background(Color.white)

                        Spacer()
                    }
                }
                .onAppear {
                    isTabBarHidden = true
                    viewModel.requestPhotoLibraryPermission()
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    private func imageGrid(gridItemSize: CGFloat) -> some View {
        ForEach(viewModel.images, id: \UIImage.hash) { image in
            NavigationLink(
                destination: ImageEditorView(image: image, tabIndex: $tabIndex, isTabBarHidden: $isTabBarHidden)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            ) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: gridItemSize, height: gridItemSize)
                    .clipped()
            }
        }
    }
}

#Preview {
    GalleryPickerView(isTabBarHidden: .constant(false), tabIndex: .constant(1))
}
