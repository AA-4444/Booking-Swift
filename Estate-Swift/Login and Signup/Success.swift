//
//  Success.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/29/25.
//

import SwiftUI
import RiveRuntime
import ConfettiSwiftUI
struct Success: View {
    @Binding var path: NavigationPath
    @State var showModal = false
    @Binding var show: Bool
    @State private var trigger: Int = 0
    @State private var cardScale: CGFloat = 0.5
    
    let username: String
    var body: some View {
        ZStack {
            Color("Shadow").ignoresSafeArea()
                .opacity(showModal ? 0.4 : 0)
            
           
            
            VStack(spacing: 15){
                

                Image(systemName: "checkmark.circle")
                .foregroundColor(Color.green)
                .font(.system(size: 60))
                
                Text("Succesfull registration")
                    .font(.custom("Lato-Regular", size: 20))
                    .foregroundColor(Color.black)
                
                Text(username)
                                  .font(.custom("Lato-Regular", size: 20))
                                  .foregroundColor(Color.black)
                
                
                Button {
                    
                } label: {
                    Label("Go to Login", systemImage: "arrow.forward" )
                        .font(.custom("Lato-Regular", size: 16))
                        .foregroundColor(.white)
                    
                }
                .frame(width: 190,height: 53)
                .background(Color.black)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                
            }
            .frame(width: 320,height: 400)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            
            
            
        }
        .confettiCannon(trigger: $trigger ,confettiSize: 20)
        
        .background(
            RiveViewModel(fileName: "shapes").view()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .blur(radius: 30)
                .blendMode(.hardLight)
        )
        .background(
            Image("Spline")
                .blur(radius: 50)
                .offset(x: 200, y: 100)
        )
        
        .navigationBarBackButtonHidden(true)
        .onAppear {
                   // Trigger card scale animation
                   withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                       cardScale = 1.0
                   }
                   // Trigger confetti animation after the card animation
                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                       trigger += 1
                   }
               }
    }
}

#Preview {
    Success(path: .constant(NavigationPath()), show: .constant(true), username: "TestUser")
}
