//
//  OnboardingView.swift
//  AnimatedApp
//
//  Created by Meng To on 2022-04-11.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button", autoPlay: false)
    
    @State var showModal = false
    @Binding var show: Bool
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            Color("Shadow").ignoresSafeArea()
                .opacity(showModal ? 0.4 : 0)
            
            content
                .offset(y: showModal ? -50 : 0)
            
        
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Vest Estate & Partners")
                .font(.custom("Lato-Black", size: 50))
                .frame(width: 260, alignment: .leading)
            
            Text("Find your perfect home. Rent or buy properties easily with Vest Estate. Discover great listings and make smart real estate moves today.")
                .font(.custom("Lato-Regular", size: 19))
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
      
            
            Button {
                path.append(AppRoute.login)
            } label: {
                HStack {
                    Text("Let's Start")
                        .foregroundColor(.white)
                        .font(.custom("Lato-Bold",size: 20))
                       
                    
                    Image(systemName: "arrow.forward")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top,3)
                }
                .frame(width: DeviceHelper.adaptivePadding(
                    small: 190,
                    medium: 190,
                    pro: 190,
                    proMax: 226
                ), height: DeviceHelper.adaptivePadding(
                    small: 54,
                    medium: 54,
                    pro: 54,
                    proMax: 60
                ))
                .background(Color("Color2"))
                    .cornerRadius(15)
           }
            
            Text("Find your dream home with ease. Explore rentals and properties for sale, view listings, get expert insights.")
                .font(.custom("Lato-Regular" ,size: 17))
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
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
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true),path: .constant(NavigationPath()))
    }
}


//Thanks for beautigull animation to DesignCode...
