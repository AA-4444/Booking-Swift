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
    @State private var path = NavigationPath()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                StartView(path: $path) // Set That user start from Start screen :)
                    .onAppear {
                        //-- Restore user session if available
                        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                            if let user {
                                self.user = User(name: user.profile?.name ?? "")
                                // path.append(AppRoute.home) // If logged in, go to home
                            }
                        }
                    }
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .start:
                            StartView(path: $path)
                        case .onboarding1:
                            OnBoarding1View(path: $path)
                        case .onboarding2:
                            OnBoarding2(path: $path)
                        case .onboarding3:
                            OnBoarding3(path: $path)
                        case .login:
                                Login(user: $user,path: $path)
                            case .loginemail:
                                LoginEmail(user: $user)
                            // case .home:
                            //     HomeView(user: $user)
                        }
                    }
            }
        }
    }
}

struct User {
    var name: String
}
