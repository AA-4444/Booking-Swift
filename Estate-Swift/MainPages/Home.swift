//
//  Home.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 4/7/25.
//

import SwiftUI

struct Home: View {
    @State private var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
       
        VStack {
            // Title: Browse property
          //  Text("Browse property")
            //    .font(.custom("Lato-Black", size: 25))
              //  .foregroundColor(Color("Color2"))
                //.frame(maxWidth: .infinity, alignment: .center)
                //.padding(.horizontal)
                //.padding(.bottom,10)
            
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                ZStack(alignment: .leading) {
                    if searchText.isEmpty && !isEditing {
                        Text("Search")
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                    }
                    
                    TextField("", text: $searchText, onEditingChanged: { editing in
                        withAnimation {
                            isEditing = editing
                        }
                    })
                    .padding(.vertical, 10)
                    .padding(.leading, 5)
                    .foregroundColor(.black)
                    .accentColor(.gray)
                }
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                        isEditing = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                }
            }
            .frame(height: 60)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // Featured Section
            HStack {
                Text("Featured")
                    .font(.custom("Lato-Black", size: 20))
                    .foregroundColor(.black)
                Spacer()
                Text("SEE ALL")
                    .font(.custom("Lato-Regular", size: 14))
                    .foregroundColor(Color("Color2"))
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    // Property Card 1
                    PropertyCard(
                        imageName: "PenidaHouse",
                        price: "$120,58 / year",
                        propertyType: "House",
                        rating: 4.8,
                        name: "Penida Live House",
                        location: "Nusa Penida, Bali",
                        bathrooms: 3,
                        bedrooms: 3,
                        isFavorite: false,
                        isFullWidth: false
                    )
                    
                    // Property Card 2
                    PropertyCard(
                        imageName: "ResortDeCa",
                        price: "$87,99 / year",
                        propertyType: "Resort",
                        rating: 4.8,
                        name: "Resort de Ca",
                        location: "Canggu, Bali",
                        bathrooms: 2,
                        bedrooms: 2,
                        isFavorite: true,
                        isFullWidth: false
                    )
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                
            }
            
            // Category Buttons
            HStack(spacing: 10) {
                CategoryButton(title: "Home", isSelected: true)
                CategoryButton(title: "Villa", isSelected: false)
                CategoryButton(title: "Apartment", isSelected: false)
                CategoryButton(title: "Hotel", isSelected: false)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            
            
            // Recommended For You Section
            HStack {
                Text("Recommended For You")
                    .font(.custom("Lato-Black", size: 20))
                    .foregroundColor(.black)
                Spacer()
                Text("SEE ALL")
                    .font(.custom("Lato-Regular", size: 14))
                    .foregroundColor(Color("Color2"))
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                RePropertyCard(
                imageName: "RecommendedHouse",
                price: "$339,767 / year",
                propertyType: "Apartment",
                rating: 4.8,
                name: "Akasa Live Apart",
                location: "Canggu 64, Bali",
                bathrooms: 3,
                bedrooms: 3,
                isFavorite: false,
                isFullWidth: true
                
            )
            .padding(.horizontal)
            .padding(.vertical,10)
        }
            }
            .background(Color.white)
            .offset(y: 60)
        }
    }


// Property Card Component
struct PropertyCard: View {
    let imageName: String
    let price: String
    let propertyType: String
    let rating: Double
    let name: String
    let location: String
    let bathrooms: Int
    let bedrooms: Int
    @State var isFavorite: Bool
    let isFullWidth: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .frame(maxWidth: isFullWidth ? .infinity : 180)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center) {
                        HStack(spacing: 4) {
                            Text(price)
                                .font(.custom("Lato-Black", size: 16))
                                .foregroundColor(.black)
                            Text("• \(propertyType)")
                                .font(.custom("Lato-Regular", size: 14))
                                .foregroundColor(.black)
                        }
                        Spacer()
                        if isFullWidth {
                            HStack(spacing: 8) {
                                HStack(spacing: 4) {
                                    Image(systemName: "hand.thumbsup.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 12))
                                    Text("\(rating, specifier: "%.1f")")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.black)
                                }
                                HStack(spacing: 4) {
                                    Image(systemName: "bathtub")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Text("\(bathrooms)")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.gray)
                                }
                                HStack(spacing: 4) {
                                    Image(systemName: "bed.double")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Text("\(bedrooms)")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.gray)
                                }
                            }
                        } else {
                            HStack(spacing: 4) {
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 12))
                                Text("\(rating, specifier: "%.1f")")
                                    .font(.custom("Lato-Regular", size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Text(name)
                        .font(.custom("Lato-Black", size: 16))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        Text(location)
                            .font(.custom("Lato-Regular", size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
                    .frame(width: 24, height: 24)
                    .background(Circle().fill(Color.white).frame(width: 32, height: 32))
                    .padding(8)
            }
        }
        .frame(maxWidth: isFullWidth ? .infinity : 180)
    }
}

// Recommend Card Component
struct RePropertyCard: View {
    let imageName: String
    let price: String
    let propertyType: String
    let rating: Double
    let name: String
    let location: String
    let bathrooms: Int
    let bedrooms: Int
    @State var isFavorite: Bool
    let isFullWidth: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image("House")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 170)
                    .frame(maxWidth: isFullWidth ? .infinity : 180)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center) {
                        HStack(spacing: 4) {
                            Text(price)
                                .font(.custom("Lato-Black", size: 16))
                                .foregroundColor(.black)
                            Text("• \(propertyType)")
                                .font(.custom("Lato-Regular", size: 14))
                                .foregroundColor(.black)
                        }
                        Spacer()
                        if isFullWidth {
                            HStack(spacing: 8) {
                                HStack(spacing: 4) {
                                    Image(systemName: "hand.thumbsup.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 12))
                                    Text("\(rating, specifier: "%.1f")")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.black)
                                }
                                HStack(spacing: 4) {
                                    Image(systemName: "bathtub")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Text("\(bathrooms)")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.gray)
                                }
                                HStack(spacing: 4) {
                                    Image(systemName: "bed.double")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Text("\(bedrooms)")
                                        .font(.custom("Lato-Regular", size: 14))
                                        .foregroundColor(.gray)
                                }
                            }
                        } else {
                            HStack(spacing: 4) {
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 12))
                                Text("\(rating, specifier: "%.1f")")
                                    .font(.custom("Lato-Regular", size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Text(name)
                        .font(.custom("Lato-Black", size: 16))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        Text(location)
                            .font(.custom("Lato-Regular", size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
            }
          
            
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
                    .frame(width: 24, height: 24)
                    .background(Circle().fill(Color.white).frame(width: 32, height: 32))
                    .padding(8)
            }
        }
        .frame(maxWidth: isFullWidth ? .infinity : 180)
    }
}

// Category Button Component
struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Button(action: {
            // Handle category selection
        }) {
            Text(title)
                .font(.custom("Lato-Regular", size: 15))
                .foregroundColor(isSelected ? .white : .black)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(isSelected ? Color("Color2") : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black.opacity(isSelected ? 0.15 : 0.05), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    Home()
}
