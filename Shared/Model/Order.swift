//
//  Orders.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import Foundation

//struct Order: Identifiable, Codable {
//    var id:String
//    var StudentName:String
//    var items:[String]
//    var totalPrice:Double
//
//    enum CodingKeys:String, CodingKey{
//        case id, StudentName, items, totalPrice
//    }
struct Order: Identifiable {
    var id: String
    var food: String
    var cost: Int
}
