//
//  GalleryPickerViewModel.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI
import Photos
import PhotosUI

class GalleryPickerViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    @Published var isPermissionGranted = false
    @Published var showPermissionAlert = false
    private var isPhotosFetched = false

    func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch status {
                case .authorized, .limited:
                    self.isPermissionGranted = true
                    if !self.isPhotosFetched {
                        self.fetchPhotos()
                    }
                case .denied, .restricted:
                    self.isPermissionGranted = false
                    self.showPermissionAlert = true
                default:
                    break
                }
            }
        }
    }

    func fetchPhotos() {
        guard isPermissionGranted, !isPhotosFetched else { return }
        isPhotosFetched = true

        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        fetchResult.enumerateObjects { [weak self] asset, _, _ in
            guard let self = self else { return }
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
                if let image = image, !self.images.contains(image) {
                    DispatchQueue.main.async {
                        self.images.append(image)
                    }
                }
            }
        }
    }

    func imageGridView(gridItemSize: CGFloat, tabIndex: Binding<Int>, isTabBarHidden: Binding<Bool>) -> some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ], spacing: 8) {
            ForEach(images, id: \.hashValue) { image in
                NavigationLink(
                    destination: ImageEditorView(image: image, tabIndex: tabIndex, isTabBarHidden: isTabBarHidden)
                        .onAppear {
                            isTabBarHidden.wrappedValue = true  
                        }
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
}
