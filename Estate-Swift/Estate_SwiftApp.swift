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
import Security
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {

       var facebookAppID: String?
       var facebookClientToken: String?
       var googleClientID: String?

 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        facebookAppID = Bundle.main.object(forInfoDictionaryKey: "FacebookAppID") as? String
        facebookClientToken = Bundle.main.object(forInfoDictionaryKey: "FacebookClientToken") as? String
        googleClientID = Bundle.main.object(forInfoDictionaryKey: "GIDClientID") as? String

        print("Loaded FacebookAppID: \(facebookAppID ?? "Not Found")")
        print("Loaded FacebookClientToken: \(facebookClientToken ?? "Not Found")")
        print("Loaded GIDClientID: \(googleClientID ?? "Not Found")")

        FirebaseApp.configure()

        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
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
    @State private var path = NavigationPath()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                OnboardingView(show: .constant(false), path: $path) // Set That user start from Start screen :)
                    .onAppear {
                        //-- Restore user session if available
                        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                            if let user {
                                self.user = User(name: user.profile?.name ?? "")
                            }
                        }
                    }
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .onboardingview:
                                OnboardingView(show: .constant(false), path: $path)
                        case .login:
                                Login(user: $user,path: $path)
                            case .register:
                                RegisterForm(user: $user,path: $path)
                            case .loginemail:
                                LoginEmail(user: $user,path: $path)
                            case .success(let username):
                                Success(path: $path, show: .constant(true), username: username)
                            case .setup:
                                Setup(path: $path)
                        }
                    }
            }
        }
    }
}

struct User {
    var name: String
}
