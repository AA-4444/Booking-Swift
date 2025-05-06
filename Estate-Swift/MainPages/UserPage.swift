//
//  UserPage.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 4/21/25.
//

import SwiftUI
import RiveRuntime

struct UserPage: View {
    
  
    
    @State private var profileImage: Image? = Image("default_profile")
    @State private var showingImagePicker = false
    @State private var userRole = "User"
    @State private var isFavorite1 = false
    @State private var isFavorite2 = false
    
    var body: some View {
        
            VStack(spacing: 0) {
              
                VStack(spacing: 16) {
                    // Profile and Settings Header
                    HStack() {
                        Text("Profile")
                            .font(.custom("Lato-Black", size: 24))
                            .foregroundColor(.black)
                        
                       
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.top, 50)
                    
                    //MARK:  Profile Image
                    ZStack {
                        (profileImage ?? Image("default_profile"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 2))
                        
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                        .offset(x: 40, y: 40)
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        Text("Image Picker Placeholder")
                    }
                    
                   
                    Text("Alex Zarytskyi")
                        .font(.custom("Lato-Black", size: 20))
                        .foregroundColor(.black)
                    
                    // Agent/User Selection
                    Picker("Role", selection: $userRole) {
                        Text("User").tag("User")
                        Text("Agent").tag("Agent")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 60)
                }
                .padding(.vertical, 20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                .padding(.bottom, 30)
                
                // Recent View
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Recent View")
                                .font(.custom("Lato-Black", size: 20))
                                .foregroundColor(.black)
                            Spacer()
                            Text("SEE ALL")
                                .font(.custom("Lato-Regular", size: 14))
                                .foregroundColor(Color("Color2"))
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 16) {
                                RePropertyCard(
                                    imageName: "RecommendedHouse",
                                    price: "$339,767 / year",
                                    propertyType: "Apartment",
                                    rating: 4.8,
                                    name: "Akasa Live Apart",
                                    location: "Canggu 64, Bali",
                                    bathrooms: 3,
                                    bedrooms: 3,
                                    isFavorite: isFavorite1,
                                    isFullWidth: true
                                )
                                .onTapGesture {
                                    isFavorite1.toggle()
                                }
                                
                                RePropertyCard(
                                    imageName: "PenidaHouse",
                                    price: "$120,58 / year",
                                    propertyType: "House",
                                    rating: 4.8,
                                    name: "Penida Live House",
                                    location: "Nusa Penida, Bali",
                                    bathrooms: 3,
                                    bedrooms: 3,
                                    isFavorite: isFavorite2,
                                    isFullWidth: true
                                )
                                .onTapGesture {
                                    isFavorite2.toggle()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
        
        .background(Color.gray.opacity(0.1))
        .ignoresSafeArea(.all, edges: .top) //top edge
    }
}

#Preview {
    UserPage()
}
