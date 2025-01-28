//
//  ProfileViewModel.swift
//  momogum
//
//  Created by 류한비 on 1/20/25.
//

import SwiftUI
import PhotosUI

@Observable
class ProfileViewModel {
    var selectedItem: PhotosPickerItem?
    var profileImage: Image?
    var previousProfileImage: Image?  // 이전 프로필 이미지 저장
    var uiImage: UIImage?
    
    var userName: String?
    var userID: String?
    var userBio: String?
    
    // 이미지 변경 함수
    func convertImage(from uiImage: UIImage) async {
        // 이미지를 변경할 때마다 previousProfileImage 갱신
        previousProfileImage = profileImage
        
        // 프로필 이미지 변경
        self.profileImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    // 뒤로가기 버튼 클릭시 이전 이미지로 복원 (프로필 수정 취소)
    func resetEditingProfileImage() {
        if let previousImage = previousProfileImage {
            self.profileImage = previousImage
        } else {
            self.profileImage = Image("defaultProfile")
        }
    }
    
    // 기본 이미지 사용
    func setDefaultImage() {
        previousProfileImage = profileImage
        self.profileImage = Image("defaultProfile")
    }
}
