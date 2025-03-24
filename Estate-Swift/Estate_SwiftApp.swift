//
//  Estate_SwiftApp.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//
import GoogleSignIn
import SwiftUI
import FirebaseCore
import FacebookCore
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    // Firebase Initialization...
    FirebaseApp.configure()

    // Facebook Initialization...
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

    // Google Sign-In Initialization...
    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
      if let user = user {
        print("Google user restored: \(user.profile?.name ?? "")")
      }
    }
    
    return true
  }
  
  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    let handledByFB = ApplicationDelegate.shared.application(app, open: url, options: options)
    let handledByGoogle = GIDSignIn.sharedInstance.handle(url)
    return handledByFB || handledByGoogle
  }
}



@main
struct Estate_SwiftApp: App {
    @State var user: User?
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
