//
//  AppointViewModel.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import SwiftUI

@Observable
class NewAppointViewModel {
    var appointName: String = ""
    var menuName: String = ""
    var pickedDate: Date = Date()
    var placeName: String = ""
    var note: String = ""
    var pickedFriends: [String] = ["친구1", "친구2", "친구3", "친구4"]
    var pickedImage: String = "default image"
    
    var friends: [String] = ["친구1", "친구2", "친구3", "친구4", "친구5", "친구6", "친구7", "친구8", "친구9", "친구10"]
    
    /// 초대장을 발송 및 저장소 초기화
    func createAppoint() {
        resetAppoint()
    }
    
    /// 새 약속잡기를 취소한 경우 저장소 초기화
    func resetAppoint() {
        appointName = ""
        menuName = ""
        pickedDate = Date()
        placeName = ""
        note = ""
        pickedFriends = []
        pickedImage = "default image"
    }
}
