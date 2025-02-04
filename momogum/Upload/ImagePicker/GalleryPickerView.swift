//
//  GalleryPickerView.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

struct GalleryPickerView: View {
    @StateObject private var viewModel = GalleryPickerViewModel()
    @Binding var isTabBarHidden: Bool
    @Binding var tabIndex: Int
    @State private var forceReload = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let gridItemSize = (geometry.size.width - 48) / 3

                ZStack(alignment: .top) {
                    if viewModel.isPermissionGranted {
                        ScrollView {
                            viewModel.imageGridView(gridItemSize: gridItemSize, tabIndex: $tabIndex, isTabBarHidden: $isTabBarHidden)
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
        .navigationBarHidden(true)
        .id(forceReload) // 강제 렌더링
                .onChange(of: tabIndex) {_, newValue in
                    if newValue == 1 {
                        forceReload.toggle() // ✅ forceReload 값 변경 → 뷰 강제 재렌더링
                    }
                }
    }
}

#Preview {
    GalleryPickerView(isTabBarHidden: .constant(false), tabIndex: .constant(1))
}
