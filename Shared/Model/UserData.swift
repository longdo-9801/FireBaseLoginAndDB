//
//  UserData.swift
//  myApp2 (iOS)
//
//  Created by Long, Do Ha Minh on 14/09/2022.
//
import Foundation

struct UserData {
    var id: String
    var name : String
    var email : String
    var icon : String
    var walletBalance: Int
    var orderHistory : Array<String> = []
    init(userName: String, email: String, balance: Int, orderHist: Array<String>, id: String) {
        self.name = userName
        self.email = email
        self.walletBalance = balance
        self.orderHistory = orderHist
        self.id = id
        icon = "A6MProfile"
    }
}
