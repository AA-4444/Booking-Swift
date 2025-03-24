//
//  Estate_SwiftApp.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//
import GoogleSignIn
import SwiftUI

@main
struct Estate_SwiftApp: App {
    @State var user: User?
    var body: some Scene {
        WindowGroup {
            ContentView(user: self.$user)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn {user, error in
                        if let user {
                            self.user = .init(name: user.profile?.name ?? "")
                        }
                    }
                }
        }
    }
}

struct User {
    var name: String
}
