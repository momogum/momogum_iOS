//
//  ImageEditorViewModel.swift
//  momogum_practice
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

class ImageEditorViewModel: ObservableObject {
    @Published var editedImage: EditedImageModel

    init(image: UIImage) {
        self.editedImage = EditedImageModel(image: image)
    }

    func updateScale(_ scale: CGFloat) {
        editedImage.scale = scale
    }

    func updateOffset(_ offset: CGSize) {
        editedImage.offset = offset
    }
}
