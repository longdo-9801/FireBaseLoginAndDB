//
//  SignInView.swift
//  myApp2
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
@Environment(\.dismiss) var dismiss

    @State var email = ""
    @State var name = ""
    @State var password = ""
    @State var passwordConfirmation = ""

    @State var signUpSuccess = false
    
    @EnvironmentObject var centralUserManager: UserManager
    
    
    // Sign up function to use Firebase to create a new user account in Firebase
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                signUpSuccess = false
            } else {
                print("success")
                signUpSuccess = true
                centralUserManager.addNewUser(name: name, email: email)
            }
        }
    }
    
var body: some View {
    VStack{
        Spacer()
        
        // Sign up fields to sign up for a new account
        Group {
            TextField("Email", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            TextField("UserName", text: $name)                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            SecureField("Confirm Password", text: $passwordConfirmation)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                .padding(.bottom, 30)
        }

        // Sign up button
        Button(action: {
            signUp()
        }) {
            Text("Sign Up")
                .bold()
                .frame(width: 360, height: 50)
                .background(.thinMaterial)
                .cornerRadius(10)
        }
        
        // Sign up message after pressing the sign up button
        if signUpSuccess {
            Text("Sign Up Successfully! ✅")
                .foregroundColor(.green)
        } else {
            Text("Not Sign Up Succeessfully Yet! ❌")
                .foregroundColor(.red)
        }
        
        Spacer()
        
        // Button to dismiss the sign up sheet and go back to the sign in page
        Button {
            dismiss()
        } label: {
            Text("Back to Sign In Page")
        }

        Spacer()
    }
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(UserManager(user: nil))
    }
}
