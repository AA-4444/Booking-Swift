//
//  LoginEmail.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/27/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import RiveRuntime

struct DeviceHelper {
    static let screenHeight = UIScreen.main.bounds.height
    
    static var isSmallScreen: Bool {
        return screenHeight < 700 // iPhone SE, 8, etc.
    }
    
    static var isMediumScreen: Bool {
        return screenHeight >= 700 && screenHeight < 850 // iPhone 11, 12, 13, 14, 15
    }
    
    static var isProScreen: Bool {
        return screenHeight >= 850 && screenHeight < 900 // iPhone 14 Pro, 15 Pro
    }
    
    static var isProMaxScreen: Bool {
        return screenHeight >= 900 // iPhone 14 Pro Max, 15 Pro Max, 16 Pro Max
    }

    // Reusable Padding Function
    static func adaptivePadding(small: CGFloat, medium: CGFloat, pro: CGFloat, proMax: CGFloat, fallback: CGFloat = 420) -> CGFloat {
        if isSmallScreen {
            return small
        } else if isMediumScreen {
            return medium
        } else if isProScreen {
            return pro
        } else if isProMaxScreen {
            return proMax
        } else {
            return fallback
        }
    }
}

struct LoginEmail: View {
    @Binding var user: User?
    @State private var EmailEnter: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @Binding var path: NavigationPath
    let testbutton = RiveViewModel(fileName: "testbutton", autoPlay: false)
    
    var body: some View {
        VStack {
            Image("Image-01")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: DeviceHelper.adaptivePadding(
                    small: 300,
                    medium: 500,
                    pro: 500,
                    proMax: 500
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
                    .foregroundColor(Color("Color2"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top,DeviceHelper.adaptivePadding(
                small: 10,
                medium: 20,
                pro: 20,
                proMax: 20
            ))
            
            VStack {
                // Forms for Email/Pass
                VStack {
                    // Email
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        
                        TextField("Email", text: $EmailEnter)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .focused($isEmailFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 337
                    ), height: DeviceHelper.adaptivePadding(
                        small: 60,
                        medium: 70,
                        pro: 70,
                        proMax: 70
                    ))
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isEmailFocused ? Color("Color2") : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                    .padding(.top, DeviceHelper.adaptivePadding(
                        small: 5,
                        medium: 20,
                        pro: 20,
                        proMax: 20
                    ))
                    
                    // Password
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .foregroundColor(.black)
                                .disableAutocorrection(true)
                                .focused($isPasswordFocused)
                        } else {
                            SecureField("Password", text: $password)
                                .foregroundColor(.black)
                                .disableAutocorrection(true)
                                .focused($isPasswordFocused)
                        }
                    }
                    .frame(width: DeviceHelper.adaptivePadding(small: 300, medium: 327, pro: 327, proMax: 337),
                           height: DeviceHelper.adaptivePadding(small: 60, medium: 70, pro: 70, proMax: 70))
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isPasswordFocused ? Color("Color2") : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
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
                    )) {
                        Button {
                            // Placeholder for Forgot Password action
                        } label: {
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
                            isPasswordVisible.toggle()
                        } label: {
                            Text(isPasswordVisible ? "Hide Password" : "Show Password")
                                .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                    small: 15,
                                    medium: 15,
                                    pro: 15,
                                    proMax: 15
                                )))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 5)
                }
                
                // Login button
                Button {
                    // Placeholder for Login action
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
                          small: 300,
                           medium: 320,
                           pro: 320,
                           proMax: 320
                        ), height: DeviceHelper.adaptivePadding(
                            small: 63,
                            medium: 68,
                            pro: 68,
                            proMax: 68
                    ))
                }
                .background(Color("Color2"))
                .cornerRadius(15)
                  .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                  .padding(.top,20)
                
                Spacer().frame(height: DeviceHelper.adaptivePadding(
                    small: 5,
                    medium: 140,
                    pro: 40,
                    proMax: 70
                ))
                
                VStack {
                    // Divider
                    HStack {
                        Spacer()
                        Divider()
                            .frame(width: 136, height: 1)
                            .background(Color.gray)
                            .padding(.leading, 10)
                        
                        Text("OR")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                        
                        Divider()
                            .frame(width: 136, height: 1)
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
                    
                    // Sign-in buttons
                    HStack(spacing: 10) {
                        // Google
                        Button(action: {
                            handleSignupButton()
                        }) {
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .frame(width: DeviceHelper.adaptivePadding(
                            small: 140,
                            medium: 158,
                            pro: 158,
                            proMax: 158
                        ), height: DeviceHelper.adaptivePadding(
                            small: 68,
                            medium: 70,
                            pro: 70,
                            proMax: 70
                        ))
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                        
                        // Apple (replacing Facebook)
                        Button(action: {
                            print("Apple Sign-In button clicked")
                        }) {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 33, height: 33)
                                .foregroundColor(.black)
                        }
                        .frame(width: DeviceHelper.adaptivePadding(
                            small: 140,
                            medium: 158,
                            pro: 158,
                            proMax: 158
                        ), height: DeviceHelper.adaptivePadding(
                            small: 68,
                            medium: 70,
                            pro: 70,
                            proMax: 70
                        ))
                        .background(Color.black)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
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
                                .foregroundColor(Color("Color2")) // Fixed missing dot
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, DeviceHelper.adaptivePadding(
                        small: 22,
                        medium: 0,
                        pro: 0,
                        proMax: 0
                    ))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            // Reset FocusState to prevent EXC_BAD_ACCESS
            isEmailFocused = false
            isPasswordFocused = false
            print("LoginEmail appeared with path: \(path)")
        }
        .onDisappear {
            // Ensure FocusState is reset when the view disappears
            isEmailFocused = false
            isPasswordFocused = false
            print("LoginEmail disappeared with path: \(path)")
        }
    }
    
    // Google login Function
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
}

#Preview {
    LoginEmail(user: .constant(nil), path: .constant(NavigationPath()))
}


private func getVisibleViewController(from vc: UIViewController) -> UIViewController {
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
