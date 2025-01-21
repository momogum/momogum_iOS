//
//  GalleryPickerViewModel.swift
//  momogum_practice
//
//  Created by 조승연 on 1/17/25.
//

import SwiftUI

class GalleryPickerViewModel: ObservableObject {
    @Published var images: [GalleryImageModel] = []
    
    func fetchGalleryImages() {
        // Logic to fetch images from the gallery
    }
}

