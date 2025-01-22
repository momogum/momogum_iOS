//
//  ImageEditorViewModel.swift
//  momogum
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

class ImageEditorViewModel: ObservableObject {
    @Published var scale: CGFloat = 1.0
    @Published var offset: CGSize = .zero

    private let imageAspect: CGFloat
    let originalImage: UIImage
    var image: UIImage

    init(image: UIImage) {
        self.image = image
        self.originalImage = image
        self.imageAspect = image.size.width / image.size.height
    }

    func updateScale(_ scale: CGFloat, frameSize: CGFloat) {
        self.scale = max(1.0, min(3.0, scale))
        adjustOffset(frameSize: frameSize)
    }

    func updateOffset(_ translation: CGSize, frameSize: CGFloat) {
        let scaledImageSize = CGSize(
            width: frameSize * scale,
            height: frameSize * scale / imageAspect
        )
        let maxOffset = CGSize(
            width: max(0, (scaledImageSize.width - frameSize) / 2),
            height: max(0, (scaledImageSize.height - frameSize) / 2)
        )

        offset = CGSize(
            width: min(max(-maxOffset.width, offset.width + translation.width), maxOffset.width),
            height: min(max(-maxOffset.height, offset.height + translation.height), maxOffset.height)
        )
    }

    private func adjustOffset(frameSize: CGFloat) {
        let scaledImageSize = CGSize(
            width: frameSize * scale,
            height: frameSize * scale / imageAspect
        )
        let maxOffset = CGSize(
            width: max(0, (scaledImageSize.width - frameSize) / 2),
            height: max(0, (scaledImageSize.height - frameSize) / 2)
        )

        offset = CGSize(
            width: min(max(-maxOffset.width, offset.width), maxOffset.width),
            height: min(max(-maxOffset.height, offset.height), maxOffset.height)
        )
    }

    func finalizeImage(frameSize: CGFloat) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: frameSize, height: frameSize))
        return renderer.image { context in
            let scaledImageSize = CGSize(
                width: frameSize * scale,
                height: frameSize * scale / imageAspect
            )

            let drawingRect = CGRect(
                x: (frameSize - scaledImageSize.width) / 2 + offset.width,
                y: (frameSize - scaledImageSize.height) / 2 + offset.height,
                width: scaledImageSize.width,
                height: scaledImageSize.height
            )

            image.draw(in: drawingRect)
        }
    }

    func resetToOriginalImage() {
        image = originalImage
        scale = 1.0
        offset = .zero
    }
}
