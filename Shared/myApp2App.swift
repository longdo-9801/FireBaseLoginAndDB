//
//  myApp2App.swift
//  Shared
//
//  Created by Long, Do Ha Minh on 12/09/2022.
//

import SwiftUI
import Firebase

@main
struct myApp2App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
