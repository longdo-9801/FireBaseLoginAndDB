//
//  UserData.swift
//  myApp2 (iOS)
//
//  Created by Long, Do Ha Minh on 14/09/2022.
//

import Foundation

struct UserData {
    var name : String
    var email : String
    var icon : String
    init(userName: String, email: String) {
        self.name = userName
        self.email = email
        icon = "A6MProfile"
    }
}
