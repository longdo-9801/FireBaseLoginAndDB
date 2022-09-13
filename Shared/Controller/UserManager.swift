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
        var name = userDB.collection("users").whereField("email", in: <#T##[Any]#>)
        self.user = UserData(userName: <#T##String#>, email: <#T##String#>)
    }
    
    func addNewUser(name: String, email: String) {
        userDB.collection("users").addDocument(data: ["name" : name, "email" : email ])
    }
    
    
}
