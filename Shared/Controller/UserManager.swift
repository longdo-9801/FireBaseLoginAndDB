//
//  UserManager.swift
//  myApp2 (iOS)
//
//  Created by Long, Do Ha Minh on 13/09/2022.
//

import Foundation
import FirebaseFirestore

class UserManager: ObservableObject {
    @Published var user: UserData?
    
    private var userDB = Firestore.firestore()
    
    init(user : UserData?) {
        self.user = user
    }
    
    func setActiveUser(email: String) {
        var userName = "Empty"
        var balance = 0
        var orderHist: Array<String> = []
        userDB.collection("users").whereField("email", isEqualTo: email).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    userName = (document.get("name") as? String)!
                    balance = (document.get("balance") as? Int)!
                    orderHist = (document.get("order") as? Array<String>)!
                    self.user = UserData(userName: userName, email: email, balance: balance, orderHist: orderHist)
                }
            }
        }
        
    }
    
    func updateUser(cost: Int, orderID: String) {
        self.user?.walletBalance -= cost
        self.user?.orderHistory.append(orderID)
        userDB.collection("users").whereField("email", isEqualTo: self.user?.email as Any).setValue(self.user?.walletBalance, forUndefinedKey: "balance")
        userDB.collection("users").whereField("email", isEqualTo: self.user?.email as Any).setValue(self.user?.orderHistory, forUndefinedKey: "order")
    }
    
    func deleteOrder() {
        
    }
    
    func addNewUser(name: String, email: String) {
        userDB.collection("users").addDocument(data: ["name" : name, "email" : email, "balance" : 0, "orderHistory" : [] ])
    }
    
    
}
