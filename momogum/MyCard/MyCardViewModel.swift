//
//  MyCardViewModel.swift
//  momogum
//
//  Created by 조승연 on 2/1/25.
//

import SwiftUI

class MyCardViewModel: ObservableObject {
    @Published var myCard = MyCardModel(likeCount: 0, reviewText: "식사 후기내용", showBookmark: false)
    @Published var showPopup = false
    @Published var showDeleteConfirm = false
    @Published var showDeleted = false

    func togglePopup() {
        withAnimation {
            showPopup.toggle()
        }
    }

    func toggleBookmark() {
        myCard.showBookmark.toggle()
    }

    func incrementLikeCount() {
        myCard.likeCount += 1
    }

    func resetLikeCount() {
        myCard.likeCount = 0
    }

    func confirmDelete() {
        showDeleteConfirm = true
    }

    func deletePost() {
        showDeleteConfirm = false
        showDeleted = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showDeleted = false
        }
    }
}
