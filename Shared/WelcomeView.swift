//
//  WelcomeView.swift
//  myApp2
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI
import FirebaseFirestore

struct WelcomeView: View {
    @State var username: String = "M"
    @State var email: String = ""
    @State var orderList: Array<Order> = []
    @State var viewForceUpdater: Int = 0
    @EnvironmentObject var centralUserManager : UserManager
    
    
    func getOrderList() {
        let orderDB = Firestore.firestore()
        orderList.removeAll()
        print("debug array")
        dump(centralUserManager.user?.orderHistory ?? ["EMPTY"])
        for orderID in centralUserManager.user?.orderHistory ?? [] {
            orderDB.collection("order").document(orderID).getDocument() {
                (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        print("DEBUG ORDERLIST")
                        
                        orderList.append(Order(id: String(querySnapshot!.documentID), food: querySnapshot?.get("food") as! String, cost: querySnapshot?.get("cost") as! Int))
                        dump(orderList)
                        }
            }
        }
        
    }
    
    func DEBUG_addOrder() {
        centralUserManager.updateUser(cost: 200, orderID: "256")
    }
    
    var body: some View {
        VStack {
            RoundView(icon: Image("A6MProfile"))
            RoundViewDynamic(name: $username)
            Text("Login Successfully! ✅")
                .foregroundColor(.green).onAppear(){
                    print("Debug UM")
                    centralUserManager.setActiveUser(email: email) {
                        username = centralUserManager.user?.name ?? "NamelessOne"
                        print("DEBUG USERNAME: \(username)")
                        getOrderList()
                      }
                    //dump(centralUserManager)

                    
                }
            Text("Welcome \(username)")
            Button {
                DEBUG_addOrder()
                centralUserManager.setActiveUser(email: email) {
                    getOrderList()
                    //viewForceUpdater += 1
                    print("INSIDE: \(viewForceUpdater)")
                }
                print("OUTSIDE: \(viewForceUpdater)")
            } label: {
                Text("🍔ADD ORDER TO YOUR HISTORY, FRIEND🦊")
            }
            VStack {
                TableView(title: "Account Balance", content: String(centralUserManager.user?.walletBalance ?? 0))
                ForEach(orderList) { record in
                    VStack {
                        Text("Order")
                        TableView(title: "Food", content: record.food)
                        TableView(title: "Cost", content: "\(record.cost)")
                    }.padding(.vertical,5).border(.black,width: 2)
                    
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(UserManager(user: UserData(userName: "Plaza HOLden", email: "text", balance: 0, orderHist: [], id: "BTAq8Zxfy6m2Q4ni58NC")))
    }
}
