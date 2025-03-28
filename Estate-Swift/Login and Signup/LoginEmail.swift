//
//  LoginEmail.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/27/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import FacebookLogin
import FBSDKLoginKit
import FBSDKCoreKit

struct LoginEmail: View {
        @Binding var user:  User?
        
   let images = ["Image1", "Image2", "Image3", "Image4"]
    @State private var EmailEnter: String = ""
    @State private var Password: String = ""
       
            
            var body: some View {
                VStack(){
                 Image("Image-0")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: DeviceHelper.adaptivePadding(
                            small: 170,
                            medium: 210,
                            pro: 210,
                            proMax: 238
                        ))
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    HStack {
                        Text("Let’s")
                            .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                small: 27,
                                medium: 30,
                                pro: 30,
                                proMax: 30
                            )))
                            .foregroundColor(.black)
                          
                        Text("Sign In")
                            .font(.custom("Lato-Black", size: DeviceHelper.adaptivePadding(
                                small: 27,
                                medium: 30,
                                pro: 30,
                                proMax: 30
                            )))
                            .foregroundColor(.black)
                           
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                   
                    VStack {
                        //Forms for Email/Pass
                        VStack {
                            //Email
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(.black)
                                    .padding(.leading,20)
                                
                                TextField("Email", text: $EmailEnter)
                                    .foregroundColor(.black)
                                    .disableAutocorrection(true)
                            }
                            .frame(width: DeviceHelper.adaptivePadding(
                                small: 300,
                                medium: 327,
                                pro: 327,
                                proMax: 337
                            ), height:  DeviceHelper.adaptivePadding(
                                small: 60,
                                medium: 70,
                                pro: 70,
                                proMax: 70
                            ))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .padding(.top ,DeviceHelper.adaptivePadding(
                                small: 5,
                                medium: 20,
                                pro: 20,
                                proMax: 20
                            ))
                            
                            //Password
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.black)
                                    .padding(.leading,20)
                                
                                TextField("Password", text: $Password)
                                    .foregroundColor(.black)
                                    .disableAutocorrection(true)
                            }
                           // .frame(width: 327, height: 70)
                            .frame(width: DeviceHelper.adaptivePadding(
                                small: 300,
                                medium: 327,
                                pro: 327,
                                proMax: 337
                            ), height:  DeviceHelper.adaptivePadding(
                                small: 60,
                                medium: 70,
                                pro: 70,
                                proMax: 70
                            ))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .padding(.top, DeviceHelper.adaptivePadding(
                                small: 10,
                                medium: 20,
                                pro: 20,
                                proMax: 20
                            ))
                            
                            // Forgot and Show Pass
                            HStack(spacing: DeviceHelper.adaptivePadding(
                                small: 70,
                                medium: 90,
                                pro: 90,
                                proMax: 90
                            )){
                                Button {
                                    
                                } label : {
                                    Text("Forgot Password ?")
                                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                            small: 15,
                                            medium: 15,
                                            pro: 15,
                                            proMax: 15
                                        )))
                                        .foregroundColor(.black)
                                    
                                    
                                }
                                
                                
                                Button {
                                    
                                } label : {
                                    Text("Show Password")
                                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                            small: 15,
                                            medium: 15,
                                            pro: 15,
                                            proMax: 15
                                        )))
                                        .foregroundColor(.black)
                                    
                                    
                                }
                            }
                            .padding(.top,5)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Login")
                                .font(.custom("Lato-Black", size: DeviceHelper.adaptivePadding(
                                    small: 22,
                                    medium: 22,
                                    pro: 22,
                                    proMax: 22
                                )))
                                .foregroundColor(.white)
                                .frame(width: DeviceHelper.adaptivePadding(
                                    small: 250,
                                    medium: 278,
                                    pro: 278,
                                    proMax: 278
                                ),height: DeviceHelper.adaptivePadding(
                                    small: 50,
                                    medium: 63,
                                    pro: 63,
                                    proMax: 63
                                ))
                              
                        }
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        .padding(.top,20)
                        
                        Spacer().frame(height:  DeviceHelper.adaptivePadding(
                            small: 10,
                            medium: 140,
                            pro: 90,
                            proMax: 120
                        ))
                        
                        VStack {
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
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(25)
                                
                                
                                //MARK: Facebook button...
                                Button(action: {
                                    loginWithFacebook()
                                }) {
                                    Image("facebook")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25,height: 25)
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
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(25)
                            }
                            .padding(.top,5)
                            .padding(.bottom ,5)
                            
                            
                            
                            HStack {
                                Text("Don't have an account?")
                                    .font(.custom("Lato-Regular", size: 15))
                                +
                                Text(" Register")
                                    .font(.custom("Lato-Black", size: 15))
                            }
                            .padding(.top,15)
                            .padding(.bottom, DeviceHelper.adaptivePadding(
                                small: 22,
                                medium: 0,
                                pro: 0,
                                proMax: 0
                            ))
                            
                            
                           
                        }
                      
                    }
                    
                }
          //  .background(Color.black)
               // .padding(.bottom,10)
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
                        proMax: 200
                    ) ,height:  DeviceHelper.adaptivePadding(
                        small: 158,
                        medium: 174,
                        pro: 174,
                        proMax: 200
                    ))
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        
        
        
        //MARK: Google login Function
        func handleSignupButton() {
            print("Login with Google")
            
            if let rootViewController = getRootViewController() {
                GIDSignIn.sharedInstance.signIn(
                    withPresenting: rootViewController
                ) { singInResult, error in
                    guard let result = singInResult else {
                        // inspect error
                        return
                    }
                    self.user = User.init(name: result.user.profile?.name ?? "")
                }
            }
            
            
            
           
        }
        
        //MARK:  Facebook Login Function
        func loginWithFacebook() {
            let loginManager = LoginManager()
            
            // -- Requesting permissions to access user data
            loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
                if let error = error {
                    print("Error during Facebook login: \(error.localizedDescription)")
                    return
                }
                
                // Check if the login was cancelled
                guard let result = result, !result.isCancelled else {
                    print("Facebook login was cancelled")
                    return
                }
                
                // Facebook login successful
                if let accessToken = AccessToken.current {
                   
                    print("Facebook user logged in: \(accessToken.userID)")
                    
                    let request = GraphRequest(graphPath: "me", parameters: ["fields": "id,name,email"])
                    request.start { connection, result, error in
                        if let error = error {
                            print("Error fetching Facebook user details: \(error.localizedDescription)")
                            return
                        }
                        
                        // Handle the returned user data
                        if let userDetails = result as? [String: Any] {
                            let userName = userDetails["name"] as? String ?? "Unknown User"
                            let userEmail = userDetails["email"] as? String ?? "No Email"
                            
                            
                            print("User name: \(userName), Email: \(userEmail)")
                            
                           
                            self.user = User(name: userName)
                        }
                    }
                }
            }
        }


    }
    //for test
    #Preview {
        LoginEmail(user: .constant(nil))
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
