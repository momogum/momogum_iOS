//
//  GalleryPickerView.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//
import SwiftUI
import PhotosUI

struct GalleryPickerView: View {
    @Binding var tabIndex: Int
    @Environment(\.presentationMode) var presentationMode // 뒤로가기 기능

    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationBarBackButtonHidden(true) // 기본 백 버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 뒤로가기 동작
                }) {
                    Image(systemName: "chevron.left") // 쉐브론 아이콘
                        .foregroundColor(.black) // 색상 설정
    @State private var selectedImages: [UIImage] = []
    @State private var isPermissionGranted = false
    @State private var showPermissionAlert = false

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
                    if isPermissionGranted {
                        ScrollView {
                            LazyVGrid(columns: gridItems, spacing: 8) {
                                ForEach(selectedImages, id: \.self) { image in
                                    NavigationLink(destination: ImageEditorView(image: image)) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: gridItemSize, height: gridItemSize)
                                            .clipped()
                                    }
                                }
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
                        ZStack {
                            Text("사진 선택")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)

                            HStack {
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(height: 60)
                        .background(Color.white)
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

#Preview {
    GalleryPickerView() // 수정: 기본값 전달
}

