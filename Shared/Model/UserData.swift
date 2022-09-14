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
    var walletBalance: Int
    var orderHistory : Array<String> = []
    init(userName: String, email: String, balance: Int, orderHist: Array<String>) {
        self.name = userName
        self.email = email
        self.walletBalance = balance
        self.orderHistory = orderHist
        icon = "A6MProfile"
    }
}
