//
//  Favorites.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 5/14/25.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        VStack {
            Image("Favorites1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400,height: 400)
            
          
            
            VStack {
                Text("Save what you like ")
                    .font(.custom("Lato-Black", size: 30))
                    .foregroundColor(Color("Color2"))
                
                
                
                Text("Create lists of your favorite properties to help you share, compare & book.")
                    .font(.custom("Lato-Regular", size: 20))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 25)
                    .padding(.top,5)
            }
        }
        .offset(y: -40)
    }
}

#Preview {
    Favorites()
}
