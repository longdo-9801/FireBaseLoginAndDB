//
//  WelcomeView.swift
//  myApp2
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var username: String = ""
    @State var email: String = ""
    @EnvironmentObject var User : UserManager
    
    
    func getUserName() {
        
    }
    
    var body: some View {
        VStack {
            Text("Login Successfully! ✅")
            .foregroundColor(.green)
            Text("Welcome \(User.user?.name ?? "NamelessOne")").onAppear(){
                print("DEBUG")
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(UserManager(user: UserData(userName: "Plaza HOLden", email: "text")))
    }
}
