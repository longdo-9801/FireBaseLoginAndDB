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
        var nameQuery = userDB.collection("users").whereField("email", isEqualTo: email).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    userName = (document.get("name") as? String)!
                    self.user = UserData(userName: userName, email: email)
                }
            }
    }
        
    }
    
    func addNewUser(name: String, email: String) {
        userDB.collection("users").addDocument(data: ["name" : name, "email" : email ])
    }
    
    
}
