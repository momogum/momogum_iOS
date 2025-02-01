//
//  AppointViewModel.swift
//  momogum
//
//  Created by nelime on 1/21/25.
//

import SwiftUI
import Alamofire

struct SendingData: Codable {
    let name: String
    let menu: String
    let date: Date
    let place: String
    let note: String
}

@Observable
class NewAppointViewModel {
    var appointName: String = ""
    var menuName: String = ""
    var pickedDate: Date = Date()
    var placeName: String = ""
    var note: String = ""
    var pickedFriends: [String] = []
    var pickedImage: String = ""
    
    var friends: [String] = ["친구1", "친구2", "친구3", "친구4", "친구5", "친구6", "친구7", "친구8", "친구9", "친구10"]
    
    /// 초대장을 발송 및 저장소 초기화
    func createAppoint() {
        //        let sendingData = SendingData(name: self.appointName, menu: self.menuName, date: self.pickedDate, place: self.placeName, note: self.note)
        
        let parm: Parameters = [
            "name": self.appointName,
            "menu": self.menuName,
            "date": "2025-02-01T09:26:34.192Z",
            "location": self.placeName,
            "notes": self.note
        ]
        
        printingForDebug()
        resetAppoint()
        
        let url = "http://15.164.59.139:8080/Appointment/name"
//        let encoder = JSONEncoder()
//        encoder.dateEncodingStrategy = .iso8601
        
//        guard let jsonData = try? encoder.encode(sendingData) else {
//            fatalError("Couldn't encode JSON")
//        }
        
        AF.request(url,
                   method: .post,
                   parameters: parm,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"])
        .responseString { response in
            
            switch response.result {
            case .success(let responseBody):
                print("Response received successfully: \(responseBody)")
            case .failure(let error):
                print("Error: \(error)")
                return
            }
            
        }
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
    
    /// 디버그를 위한 약속잡기 임시저장 데이터 출력
    func printingForDebug() {
        print(appointName)
        print(menuName)
        print(pickedDate)
        print(placeName)
        print(note)
        print(pickedFriends)
        print(pickedImage)
    }
}
