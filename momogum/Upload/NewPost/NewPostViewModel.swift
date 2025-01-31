//
//  NewPostViewModel.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import Foundation
import SwiftUI

class NewPostViewModel: ObservableObject {
    @Published var newPost = NewPostModel(selectedCategory: nil, tags: [], mealPlace: "", newExperience: "", selectedIcon: nil)

    func updateSelectedCategory(_ category: String) {
        newPost.selectedCategory = category
    }

    func updateTags(_ tags: [String]) {
        newPost.tags = tags
    }

    func updateMealPlace(_ place: String) {
        newPost.mealPlace = place
    }

    func updateExperience(_ experience: String) {
        newPost.newExperience = experience
    }

    func updateSelectedIcon(_ icon: String) {
        newPost.selectedIcon = icon
    }

    func resetPost() {
        newPost = NewPostModel(selectedCategory: nil, tags: [], mealPlace: "", newExperience: "", selectedIcon: nil)
    }
}
