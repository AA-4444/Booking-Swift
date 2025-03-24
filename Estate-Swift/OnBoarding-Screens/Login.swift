//
//  Login.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//

import GoogleSignIn
import SwiftUI

struct Login: View {
    @Binding var user:  User?
    
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
                    .background(Color("Color1"))
                    .cornerRadius(15)
                    
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
                        .frame(width: 158,height: 70)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        
                        
                        //MARK: Facebook...
                        Button(action: {
                            
                        }) {
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25,height: 25)
                        }
                        .frame(width: 158,height: 70)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                    }
                    .padding(.top,5)
                    .padding(.bottom ,5)
                }
                
                HStack {
                    Text("Don't have an account?")
                        .font(.custom("Lato-Regular", size: 15))
                    +
                    Text(" Register")
                        .font(.custom("Lato-Black", size: 15))
                }
                    .padding(.bottom,15)
                
            }
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
}
#Preview {
    Login(user: .constant(nil))
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
