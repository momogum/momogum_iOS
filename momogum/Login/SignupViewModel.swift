//
//  SignupViewModel.swift
//  momogum
//
//  Created by 서재민 on 1/16/25.
//

import Foundation
//Post

@Observable
class SignupViewModel {
    var username = ""
    var ID = ""
    
    func creatUser() async {
         await AuthManager.shared.creatUser(username: username, ID: ID)
        username = ""
        ID = ""
    }
}
