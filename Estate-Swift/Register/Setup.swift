//
//  SwiftUIView.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/30/25.
//

import SwiftUI
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import RiveRuntime


struct Setup: View {
    @Binding var path: NavigationPath
    var initialEmail: String? // New parameter to receive email from Login
    
    // State for form fields
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil
    
    // Focus states for fields
    @FocusState private var isNameFocused: Bool
    @FocusState private var isSurnameFocused: Bool
    @FocusState private var isPhoneNumberFocused: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Fill your")
                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                            small: 27,
                            medium: 30,
                            pro: 30,
                            proMax: 30
                        )))
                        .foregroundColor(.black)
                    
                    Text("information")
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
                .padding(.top, 20)
                
                // Profile Image Picker
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    ZStack {
                        Circle()
                            .frame(width: DeviceHelper.adaptivePadding(
                                small: 100,
                                medium: 120,
                                pro: 120,
                                proMax: 130
                            ))
                            .foregroundColor(.gray.opacity(0.2))
                        
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: DeviceHelper.adaptivePadding(
                                    small: 100,
                                    medium: 120,
                                    pro: 120,
                                    proMax: 130
                                ), height: DeviceHelper.adaptivePadding(
                                    small: 100,
                                    medium: 120,
                                    pro: 120,
                                    proMax: 130
                                ))
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .font(.system(size: DeviceHelper.adaptivePadding(
                                    small: 40,
                                    medium: 50,
                                    pro: 50,
                                    proMax: 55
                                )))
                        }
                        
                        Circle()
                            .frame(width: DeviceHelper.adaptivePadding(
                                small: 30,
                                medium: 35,
                                pro: 35,
                                proMax: 40
                            ))
                            .foregroundColor(.white)
                            .overlay(
                                Image(systemName: "pencil")
                                    .foregroundColor(.black)
                                    .font(.system(size: DeviceHelper.adaptivePadding(
                                        small: 15,
                                        medium: 18,
                                        pro: 18,
                                        proMax: 20
                                    )))
                            )
                            .offset(x: DeviceHelper.adaptivePadding(
                                small: 35,
                                medium: 40,
                                pro: 40,
                                proMax: 45
                            ), y: DeviceHelper.adaptivePadding(
                                small: 35,
                                medium: 40,
                                pro: 40,
                                proMax: 45
                            ))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 100,
                        medium: 120,
                        pro: 120,
                        proMax: 130
                    ), height: DeviceHelper.adaptivePadding(
                        small: 100,
                        medium: 120,
                        pro: 120,
                        proMax: 130
                    ))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 4)
                }
                .padding(.bottom, 10)
                .padding(.top, 20)
                
                // Forms
                VStack(spacing: DeviceHelper.adaptivePadding(
                    small: 10,
                    medium: 20,
                    pro: 20,
                    proMax: 20
                )) {
                    // Name Field
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        TextField("Name", text: $name)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .focused($isNameFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
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
                            .stroke(isNameFocused ? Color("Color2") : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    // Surname Field
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        TextField("Surname", text: $surname)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .focused($isSurnameFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
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
                            .stroke(isSurnameFocused ? Color("Color2") : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    // Phone Number Field
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        TextField("Phone Number", text: $phoneNumber)
                            .foregroundColor(.black)
                            .keyboardType(.phonePad)
                            .disableAutocorrection(true)
                            .focused($isPhoneNumberFocused)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
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
                            .stroke(isPhoneNumberFocused ? Color("Color2") : Color.clear, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    // Email Display (Read-only)
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                        Text(email)
                            .foregroundColor(.black)
                            .font(.custom("Lato-Regular", size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: DeviceHelper.adaptivePadding(
                        small: 300,
                        medium: 327,
                        pro: 327,
                        proMax: 387
                    ), height: DeviceHelper.adaptivePadding(
                        small: 60,
                        medium: 70,
                        pro: 70,
                        proMax: 70
                    ))
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                
                // Submit Button
                Button {
                    saveUserInfo()
                } label: {
                    Text("Save")
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
                        ), height: DeviceHelper.adaptivePadding(
                            small: 50,
                            medium: 63,
                            pro: 63,
                            proMax: 63
                        ))
                }
                .background(Color("Color2"))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                .padding(.top, 30)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            // Use initialEmail if provided, otherwise fallback to currentUser
            if let initialEmail = initialEmail {
                email = initialEmail
            } else if let currentUser = Auth.auth().currentUser {
                email = currentUser.email ?? "No email available"
            }
        }
        .onChange(of: selectedPhoto) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    profileImage = Image(uiImage: uiImage)
                }
            }
        }
    }
    
    private func saveUserInfo() {
            guard let userId = Auth.auth().currentUser?.uid else {
                print("No user ID available")
                return
            }
            
            guard !name.isEmpty, !surname.isEmpty, !phoneNumber.isEmpty else {
                print("All fields are required")
                return
            }
            
            var userData: [String: Any] = [
                "name": name,
                "surname": surname,
                "phoneNumber": phoneNumber,
                "email": email,
                "userId": userId
            ]
            
            if let selectedPhoto = selectedPhoto {
                Task {
                    do {
                        if let data = try await selectedPhoto.loadTransferable(type: Data.self) {
                            let storageRef = Storage.storage().reference().child("profile_images/\(userId).jpg")
                            let metadata = StorageMetadata()
                            metadata.contentType = "image/jpeg"
                            
                            let uploadTask = storageRef.putData(data, metadata: metadata) { metadata, error in
                                if let error = error {
                                    print("Error uploading image: \(error.localizedDescription)")
                                    // Save to Firestore even if image upload fails
                                    self.saveToFirestore(userData: userData, userId: userId)
                                    return
                                }
                                
                                storageRef.downloadURL { url, error in
                                    if let error = error {
                                        print("Error getting download URL: \(error.localizedDescription)")
                                    } else if let downloadURL = url {
                                        userData["profileImageURL"] = downloadURL.absoluteString
                                    }
                                    // Save to Firestore regardless of download URL success
                                    self.saveToFirestore(userData: userData, userId: userId)
                                }
                            }
                            
                            uploadTask.observe(.progress) { snapshot in
                                let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
                                print("Upload progress: \(percentComplete)%")
                            }
                        }
                    } catch {
                        print("Error loading image data: \(error.localizedDescription)")
                        self.saveToFirestore(userData: userData, userId: userId)
                    }
                }
            } else {
                saveToFirestore(userData: userData, userId: userId)
            }
        }
        
        private func saveToFirestore(userData: [String: Any], userId: String) {
            let db = Firestore.firestore()
            db.collection("users").document(userId).setData(userData) { error in
                if let error = error {
                    print("Error saving user info: \(error.localizedDescription)")
                } else {
                    print("User info saved successfully for user: \(userId)")
                    // Add a slight delay to ensure the navigation stack is ready
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        print("Navigating to Cards view, current path before append: \(self.path)")
                        self.path.append(AppRoute.cards)
                        print("Path after appending .cards: \(self.path)")
                    }
                }
            }
        }
}

#Preview {
    Setup(path: .constant(NavigationPath()), initialEmail: "test@example.com")
}
