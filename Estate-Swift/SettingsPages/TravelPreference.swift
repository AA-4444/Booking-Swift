//
//  TravelPreference.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 5/20/25.
//

import SwiftUI

struct TravelPreferenceView: View {
    @State private var prefersWindowSeat = false
    @State private var directFlightsOnly = true
    @State private var ecoFriendlyOptions = false
    @Binding var path: NavigationPath
    
    var body: some View {
       
            VStack(spacing: 0) {
                
                HStack {
                    Button(action: {
                        if !path.isEmpty {
                            path.removeLast()
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    
                    Spacer()
                    
                    Text("Travel Preference")
                       .font(.custom("Lato-Black", size: 25))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // Placeholder to balance
                    Color.clear
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                ScrollView(showsIndicators: false) {
                    sectionHeader("TRAVEL PREFERENCES")
                    
                    toggleRow(icon: "airplane", title: "Window Seat", isOn: $prefersWindowSeat)
                    toggleRow(icon: "arrow.right.arrow.left", title: "Direct Flights Only", isOn: $directFlightsOnly)
                    toggleRow(icon: "leaf.fill", title: "Eco-Friendly Options", isOn: $ecoFriendlyOptions)
                }
                Spacer()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarBackButtonHidden(true)
        
    }
    
    // MARK: Section Header
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: Toggle Row
    private func toggleRow(icon: String, title: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Toggle("", isOn: isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}

struct TravelPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        TravelPreferenceView(path: .constant(NavigationPath()))
    }
}
