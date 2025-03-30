//
//  Login.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import FacebookLogin
import FBSDKLoginKit
import FBSDKCoreKit



struct Login: View {
    @Binding var user:  User?
    @Binding var path: NavigationPath
        let images = ["Image1", "Image2", "Image3", "Image4"]
    
   
        
        var body: some View {
            VStack(spacing:  DeviceHelper.adaptivePadding(
                small: 5,
                medium: 30,
                pro: 30,
                proMax: 30
            )) {
                Grid {
                    GridRow {
                        ImageView(imageName: images[0])
                        ImageView(imageName: images[1])
                    }
                    GridRow {
                        ImageView(imageName: images[2])
                        ImageView(imageName: images[3])
                    }
                }
                .padding()
               
                
                Text("Ready to explore ?")
                    .font(.custom("Lato-Black", size: DeviceHelper.adaptivePadding(
                        small: 27,
                        medium: 30,
                        pro: 30,
                        proMax: 30
                    )))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                   .padding(.bottom, 20)
                   
                
                VStack {
                    //MARK: Email login...
                    Button {
                        //Email login
                        path.append(AppRoute.loginemail)
                    } label: {
                        HStack {
                            Image(systemName: "envelope")
                                .symbolRenderingMode(.monochrome)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .regular))
                            
                            Text("Continue with Email")
                                .font(.custom("Lato-Black", size: 20))
                                .foregroundColor(.white)
                        }
                        
                    }
                    .frame(width: 326,height: 63)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    //Divider
                    HStack {
                        Spacer()
                        Divider()
                            .frame(width: 136,height: 1)
                            .background(Color.gray)
                            .padding(.leading, 10)
                        
                        
                        Text("OR")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                        
                        
                        Divider()
                            .frame(width: 136,height: 1)
                        
                            .background(Color.gray)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                    .padding(.top, DeviceHelper.adaptivePadding(
                        small: 10,
                        medium: 25,
                        pro: 25,
                        proMax: 25
                    ))
                    
                    
                    //MARK: Signin with buttons...
                    HStack(spacing: 10) {
                        //MARK: Google...
                        Button(action: {
                            handleSignupButton()
                            
                        }) {
                            
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                        .padding() // Adds padding to expand the content
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .frame(width:
                               DeviceHelper.adaptivePadding(
                                   small: 140,
                                   medium: 158,
                                   pro: 158,
                                   proMax: 158
                               ),height: DeviceHelper.adaptivePadding(
                                small: 68,
                                medium: 70,
                                pro: 70,
                                proMax: 70
                            ))
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                        
                        
                        //MARK: Facebook button...
                        Button(action: {
                            loginWithFacebook()
                        }) {
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                        .padding()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .frame(width:
                               DeviceHelper.adaptivePadding(
                                   small: 140,
                                   medium: 158,
                                   pro: 158,
                                   proMax: 158
                               ),height: DeviceHelper.adaptivePadding(
                                small: 68,
                                medium: 70,
                                pro: 70,
                                proMax: 70
                            ))
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    }
                    .padding(.top,5)
                    .padding(.bottom ,5)
                }
                
                HStack {
                    
                    Button {
                        path.append(AppRoute.register)
                    } label: {
                        Text("Don't have an account?")
                            .font(.custom("Lato-Regular", size: 15))
                            .foregroundColor(.black)
                        +
                        Text(" Register")
                            .font(.custom("Lato-Black", size: 15))
                            .foregroundColor(.black)
                    }
                }
                    .padding(.bottom,15)
                
            }
            .navigationBarBackButtonHidden(true)
        }
    
   
    
    //Set up for grid images...
    struct ImageView: View {
        let imageName: String
        
        var body: some View {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: DeviceHelper.adaptivePadding(
                    small: 158,
                    medium: 174,
                    pro: 174,
                    proMax: 190
                ) ,height:  DeviceHelper.adaptivePadding(
                    small: 158,
                    medium: 174,
                    pro: 174,
                    proMax: 190
                ))
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
    
    
    // Google login function
     func handleSignupButton() {
         print("Login with Google")
         
         if let rootViewController = getRootViewController() {
             GIDSignIn.sharedInstance.signIn(
                 withPresenting: rootViewController
             ) { signInResult, error in
                 guard let result = signInResult else {
                     print("Google Sign-In error: \(error?.localizedDescription ?? "Unknown error")")
                     return
                 }
                 
                 let userName = result.user.profile?.name ?? "Google User"
                 self.user = User(name: userName)
                 path.append(AppRoute.success(username: userName))
                 print("Google login successful for user: \(userName)")
             }
         }
     }
     
     // Facebook login function
     func loginWithFacebook() {
         let loginManager = LoginManager()
         
         loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
             if let error = error {
                 print("Error during Facebook login: \(error.localizedDescription)")
                 return
             }
             
             guard let result = result, !result.isCancelled else {
                 print("Facebook login was cancelled")
                 return
             }
             
             if let accessToken = AccessToken.current {
                 print("Facebook user logged in: \(accessToken.userID)")
                 
                 let request = GraphRequest(graphPath: "me", parameters: ["fields": "id,name,email"])
                 request.start { connection, result, error in
                     if let error = error {
                         print("Error fetching Facebook user details: \(error.localizedDescription)")
                         return
                     }
                     
                     if let userDetails = result as? [String: Any] {
                         let userName = userDetails["name"] as? String ?? "Facebook User"
                         self.user = User(name: userName)
                         path.append(AppRoute.success(username: userName))
                         print("Facebook login successful for user: \(userName)")
                     }
                 }
             }
         }
     }


}
//for test
#Preview {
    Login(user: .constant(nil), path: .constant(NavigationPath()))
}
   


func getRootViewController() -> UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes.first as?
            UIWindowScene,
          let rootViewController = scene.windows.first?.rootViewController else {
              return nil
              }
return getVisibleViewController(from: rootViewController)
}

    private func getVisibleViewController(from vc: UIViewController) ->
        UIViewController {
    if let nav = vc as? UINavigationController {
        return getVisibleViewController(from: nav.visibleViewController!)
    }
    if let tab = vc as? UITabBarController {
        return getVisibleViewController(from: tab.selectedViewController!)
    }
    if let presented = vc.presentedViewController {
        return getVisibleViewController(from: presented)
    }
    return vc
}
