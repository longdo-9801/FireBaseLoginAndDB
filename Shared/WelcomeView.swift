//
//  WelcomeView.swift
//  myApp2
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI
import FirebaseFirestore

struct WelcomeView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var orderList: Array<Order> = []
    @EnvironmentObject var centralUserManager : UserManager
    
    
    func getOrderList() {
        let orderDB = Firestore.firestore()
        for orderID in centralUserManager.user?.orderHistory ?? [] {
            orderDB.collection("order").document(orderID).getDocument() {
                (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        print("DEBUG")
                        dump(querySnapshot)
                        orderList.append(Order(id: String(querySnapshot!.documentID), food: querySnapshot?.get("food") as! String, cost: querySnapshot?.get("cost") as! Int))
                        }
            }
        }
        
    }
    
    var body: some View {
        VStack {
            Text("Login Successfully! ✅")
                .foregroundColor(.green).onAppear(){
                    dump(orderList)
                    getOrderList()
                    dump(orderList)
                }
            Text("Welcome \(centralUserManager.user?.name ?? "NamelessOne")")
            Button {} label: {
                Text("🍔ADD ORDER TO YOUR HISTORY, FRIEND🦊")
            }
            VStack {
                TableView(title: "Account Balance", content: String(centralUserManager.user?.walletBalance ?? 0))
                ForEach(orderList) { record in
                    TableView(title: "Food", content: record.food)
                    TableView(title: "Cost", content: "\(record.cost)")
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(UserManager(user: UserData(userName: "Plaza HOLden", email: "text", balance: 0, orderHist: [])))
    }
}
