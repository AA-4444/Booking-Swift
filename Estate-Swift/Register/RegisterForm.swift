//
//  RegisterForm.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/29/25.
//


import SwiftUI
import FirebaseAuth
import FirebaseFirestore



struct RegisterForm: View {
    @Binding var user:  User?
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isUsernameFocused: Bool
    @Binding var path: NavigationPath
    @State private var errorMessage: String?
    @State private var showSuccessMessage: Bool = false
   
    
    var body: some View {
        VStack(){
            
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "arrow.backward")
                    .symbolRenderingMode(.monochrome)
                    .foregroundColor(Color.black)
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 54, height: 54)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,20)
            .padding(.bottom,DeviceHelper.adaptivePadding(
                small: 50,
                medium: 90,
                pro: 90,
                proMax: 100
            ))
            
            
            HStack {
                Text("Create your")
                    .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                        small: 27,
                        medium: 30,
                        pro: 30,
                        proMax: 30
                    )))
                    .foregroundColor(.black)
                
                Text("Account")
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
                    //user
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .padding(.leading,20)
                        
                        TextField("User", text: $username)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .focused($isUsernameFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
                    ), height:  DeviceHelper.adaptivePadding(
                        small: 60,
                        medium: 70,
                        pro: 70,
                        proMax: 70
                    ))
                    //  .background(Color.gray.opacity(0.2))
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isUsernameFocused ? Color.black : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                    .padding(.top ,DeviceHelper.adaptivePadding(
                        small: 5,
                        medium: 20,
                        pro: 20,
                        proMax: 20
                    ))
                    
                    
                    
                    //Email
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                            .padding(.leading,20)
                        
                        TextField("Email", text: $email)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .focused($isEmailFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
                    ), height:  DeviceHelper.adaptivePadding(
                        small: 60,
                        medium: 70,
                        pro: 70,
                        proMax: 70
                    ))
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isEmailFocused ? Color.black : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
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
                    .frame(width: DeviceHelper.adaptivePadding(small: 300, medium: 327, pro: 327, proMax: 387),
                           height: DeviceHelper.adaptivePadding(small: 60, medium: 70, pro: 70, proMax: 70))
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isPasswordFocused ? Color.black : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4) // Added shadow
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
                        proMax: 160
                    )){
                        Button {
                            
                        } label : {
                            Text("Terms of service")
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
                        } label : {
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
                    .padding(.top,10)
                }
                
                //login button
                Button {
                    registerUser()
                } label: {
                    Text("Register")
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
                .background(Color.black)
                
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                .padding(.top,20)
                
                Spacer().frame(height:  DeviceHelper.adaptivePadding(
                    small: 10,
                    medium: 140,
                    pro: 90,
                    proMax: 120
                ))
                
            }
            .padding(.bottom,DeviceHelper.adaptivePadding(
                small: 90,
                medium: 60,
                pro: 60,
                proMax: 50
            ))
            
        }
        
        .navigationBarBackButtonHidden(true)
    }
    private func registerUser() {
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "All fields are required."
            print("Registration failed: Empty fields")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let nsError = error as NSError
                errorMessage = "Registration failed: \(error.localizedDescription) (Code: \(nsError.code))"
                print("Registration error: \(nsError.code) - \(error.localizedDescription)")
                return
            }
            
            guard let userId = authResult?.user.uid else {
                errorMessage = "Failed to get user ID."
                print("No user ID found in auth result.")
                return
            }
            
            // Save user data to Firestore
            let db = Firestore.firestore()
            db.collection("users").document(userId).setData([
                "username": username,
                "email": email,
                "userId": userId
            ]) { error in
                if let error = error {
                    errorMessage = "Error saving user data: \(error.localizedDescription)"
                    print("Firestore error: \(error.localizedDescription)")
                } else {
                    print("User registered successfully with ID: \(userId)")
                    self.user = User(name: username)
                    path.append(AppRoute.success(username: username))
                }
            }
        }
    }
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



#Preview {
    RegisterForm(user: .constant(nil), path: .constant(NavigationPath()))
}
