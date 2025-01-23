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
    var pickedFriends: [String] = []
    
    
    
    func createAppoint() {
        appointName = ""
        menuName = ""
        pickedDate = Date()
        placeName = ""
        note = ""
        pickedFriends = []
    }
}
