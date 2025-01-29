//
//  ProfileViewModel.swift
//  momogum
//
//  Created by 류한비 on 1/20/25.
//

import SwiftUI

@Observable
class ProfileViewModel {
    var profileImage: Image? // 확정된 프로필 이미지
    var currentPreviewImage: Image? // 편집 중에 보여지는 미리보기 이미지
    var uiImage: UIImage?
    
    // 유저 정보 (확정)
    // 뷰 확인을 위해 초기값 설정함
    var userName: String = "머머금"
    var userID: String = "momogum._."
    var userBio: String = "오늘은 또 뭘 먹을까!? 🍪"
    
    // 유저 정보 (임시)
    var draftUserName: String = "머머금"
    var draftUserID: String = "momogum._."
    var draftUserBio: String = "오늘은 또 뭘 먹을까!? 🍪"
    
    init() {
        profileImage = Image("defaultProfile")
        currentPreviewImage = profileImage
    }
    
    // 임시 프로필 이미지 변경
    func convertPreviewImage(from uiImage: UIImage) {
        self.currentPreviewImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    // 확정 (완료 버튼 클릭 시 호출)
    func saveUserData() {
        profileImage = currentPreviewImage
        userName = draftUserName
        userID = draftUserID
        userBio = draftUserBio
    }
    
    // 편집 취소 시 초기화
    func resetUserData() {
        currentPreviewImage = profileImage
        draftUserName = userName
        draftUserID = userID
        draftUserBio = userBio
    }
    
    // 기본 이미지로 임시 설정
    func setDefaultImage() {
        currentPreviewImage = Image("defaultProfile")
    }
}
