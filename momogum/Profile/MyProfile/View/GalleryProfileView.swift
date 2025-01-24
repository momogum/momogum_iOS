//
//  GalleryProfileView.swift
//  momogum
//
//  Created by 류한비 on 1/24/25.
//


import SwiftUI
import PhotosUI

struct GalleryProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var viewModel: ProfileViewModel
    
    @State private var selectedImages: [UIImage] = []
    @State private var isPermissionGranted = false
    @State private var showPermissionAlert = false
    
    let gridItems: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 4), count: 3)
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let itemWidth = calculateItemWidth(for: geometry.size.width)
                
                VStack(spacing: 0) {
                    if isPermissionGranted {
                        ScrollView {
                            LazyVGrid(columns: gridItems, spacing: 4) {
                                ForEach(selectedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: itemWidth, height: itemWidth)
                                        .clipped()
                                        .onTapGesture {
                                            handleImageSelection(image)
                                            dismiss()
                                        }
                                }
                            }
                            .padding(.horizontal, 25)
                            .padding(.vertical, 4)
                            .padding(.top, 107)
                        }
                    }
                    
                    VStack {
                        EmptyView()
                    }
                }
                .onAppear {
                    requestPhotoLibraryPermission()
                }
                .alert(isPresented: $showPermissionAlert) {
                    Alert(
                        title: Text("권한 필요"),
                        message: Text("사진 라이브러리에 접근하려면 권한이 필요합니다."),
                        primaryButton: .default(Text("설정으로 이동"), action: {
                            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(settingsURL)
                            }
                        }),
                        secondaryButton: .cancel()
                    )
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("갤러리에서 선택")
                    .frame(height: 20)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            // 뒤로가기 버튼
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("close")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .tint(.black)
                }
            }
        }
    }
    
    private func calculateItemWidth(for width: CGFloat) -> CGFloat {
        let totalSpacing = 4 * CGFloat(3 - 1) + 50
        return (width - totalSpacing) / CGFloat(3)
    }
    
    private func handleImageSelection(_ image: UIImage) {
        Task {
            viewModel.uiImage = image
            viewModel.profileImage = Image(uiImage: image)
        }
    }
    
    private func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized, .limited:
                    isPermissionGranted = true
                    fetchPhotos()
                case .denied, .restricted:
                    isPermissionGranted = false
                    showPermissionAlert = true
                default:
                    break
                }
            }
        }
    }
    
    private func fetchPhotos() {
        guard isPermissionGranted else { return }
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        fetchResult.enumerateObjects { asset, _, _ in
            let imageManager = PHImageManager.default()
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            options.deliveryMode = .highQualityFormat
            
            imageManager.requestImage(
                for: asset,
                targetSize: CGSize(width: 200, height: 200),
                contentMode: .aspectFill,
                options: options
            ) { image, _ in
                if let image = image {
                    DispatchQueue.main.async {
                        selectedImages.append(image)
                    }
                }
            }
        }
    }
}
