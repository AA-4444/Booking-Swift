//
//  ContentView.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//

import GoogleSignIn
import SwiftUI

struct ContentView: View {
    @Binding var user: User?
    var body: some View {
        if let user {
            Text("Hello there, \(user.name)")
            Button {
                GIDSignIn.sharedInstance.signOut()
                self.user = nil
            } label: {
                Text("Log out")
            }
        } else {
            Login(user: self.$user)
        }
    }
}

