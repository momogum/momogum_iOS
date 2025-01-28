//
//  Appointment.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import Foundation

/// 초대장 모델, 8속성 [id, appointName, menuName, pickedDate, placeName, note, pickedFriends, isConfirmed]
struct Appoint: Codable, Identifiable {
    let id: String
    
    var senderName: String
    var appointName: String
    var menuName: String
    var pickedDate: Date
    var placeName: String
    var note: String?
    var pickedFriends: [String]
    
    var isConfirmed: Bool = false
    
    
}

extension Appoint {
    static var DUMMY_APM: Appoint = Appoint(
        id: UUID().uuidString,
        senderName: "김더미",
        appointName: "더미 모임",
        menuName: "쿠차라 더미 부리또",
        pickedDate: Date(),
        placeName: "마포구 더미동",
        note: "꾸밈단계 더미단계",
        pickedFriends: ["test", "test2", "test3"]
    )
}
