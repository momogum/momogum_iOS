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
    
    
    
    func createAppoint() {
        appointName = ""
        menuName = ""
        pickedDate = Date()
        placeName = ""
        note = ""
        pickedFriends = []
        pickedImage = "default image"
    }
    
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
