//
//  Appointment.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import Foundation

struct Appointment: Codable, Identifiable {
    let id: String
    
    var appointName: String
    var menuName: String
    var pickedDate: Date
    var placeName: String
    var note: String?
    var pickedFriends: [String]
    
    
}

extension Appointment {
    static var DUMMY_APM: Appointment = Appointment(id: UUID().uuidString, appointName: "더미 모임", menuName: "쿠차라 더미 부리또", pickedDate: Date(), placeName: "마포구 더미동", note: "꾸밈단계 더미단계", pickedFriends: ["test", "test2", "test3"])
}
