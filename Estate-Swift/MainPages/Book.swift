//
//  Book.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 5/14/25.
//

import SwiftUI

struct Book: View {
    @State private var selectedTab: String = "Activity"
    
    var body: some View {
        VStack {
          //  Spacer() // Pushes content to the center vertically
            Spacer().frame(height: 80)
            // Selector Tabs
            HStack(spacing: 20) {
                Button(action: { selectedTab = "Activity" }) {
                    Text("Activity")
                        .font(.custom("Lato-Regular", size: 16))
                        .foregroundColor(selectedTab == "Activity" ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(selectedTab == "Activity" ? Color("Color2") : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(selectedTab == "Activity" ? 0.15 : 0.05), radius: 5, x: 0, y: 2)
                }

                Button(action: { selectedTab = "Past" }) {
                    Text("Past")
                        .font(.custom("Lato-Regular", size: 16))
                        .foregroundColor(selectedTab == "Past" ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(selectedTab == "Past" ? Color("Color2") : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(selectedTab == "Past" ? 0.15 : 0.05), radius: 5, x: 0, y: 2)
                }

                Button(action: { selectedTab = "Canceled" }) {
                    Text("Canceled")
                        .font(.custom("Lato-Regular", size: 16))
                        .foregroundColor(selectedTab == "Canceled" ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(selectedTab == "Canceled" ? Color("Color2") : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(selectedTab == "Canceled" ? 0.15 : 0.05), radius: 5, x: 0, y: 2)
                }
            }
            
            Spacer().frame(height: 100)
            
            VStack(spacing: 20) {
                Image("Travel1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                
                Text("Where go next ?")
                    .font(.custom("Lato-Black", size: 30))
                    .foregroundColor(Color("Color2"))
                
                Text("You haven't started any trips yet. Once you make a booking, it all will be here")
                    .font(.custom("Lato-Regular", size: 17))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 25)
                    .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer() // Pushes content to the center vertically
        }
    }
}

#Preview {
    Book()
}
