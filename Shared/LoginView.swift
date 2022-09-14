//
//  ContentView.swift
//  Shared
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var isLogin: Bool = false
    @State var showSignUp: Bool = false
    @StateObject var centralUserManager : UserManager = UserManager(user: nil)
    //@State var ActiveUser: UserData? = nil
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                isLogin = false
            } else {
                print("Success")
                centralUserManager.setActiveUser(email: email)
                isLogin = true
            }
        }
    }
    var body: some View {
        VStack {
            if isLogin {
                WelcomeView().environmentObject(centralUserManager)
            } else {
                Spacer()
                
                // Login fields to sign in
                Group {
                    TextField("Email", text: $email)                .textInputAutocapitalization(.never)
                    SecureField("Password", text: $password)
                }

                // Login button
                Button {
                    login()
                } label: {
                    Text("Sign in")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                }

                // Login message after pressing the login button
                Text("Not Login Succeessfully Yet! ❌")
                    .foregroundColor(.red)

                Spacer()
                
                 //Button to show the sign up sheet
                Button {
                    showSignUp.toggle()
                } label: {
                    Text("Sign Up Here!")
                }
                .padding()
                .sheet(isPresented: $showSignUp) {
                        SignUpView()
                }

             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
