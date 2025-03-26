//
//  SwiftUIView.swift
//  Estate
//
//  Created by Алексей Зарицький on 3/19/25.
//

import SwiftUI

struct OnBoarding1View: View {
    @Binding var path: NavigationPath
    var isSmallDevice: Bool {
           UIScreen.main.bounds.height < 700 // Adjust this threshold for small devices
       }
    
    var body: some View {
        VStack {
            HStack() {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)
                    
              Spacer()
                
                
                Button {
                    
                } label: {
                    Text("Skip")
                        .font(.custom("Lato-Regular", size: 20))
                        .foregroundColor(.black)
                        .frame(width: 120,height: 50)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(25)
                }
            }
            .padding(.horizontal,10)
          //  .padding(.top,60)
            .padding(.top, DeviceHelper.isSmallScreen ? 60 : DeviceHelper.isMediumScreen ? 0 : 0) 
          
            
                HStack {
                    Text("Find best place \n")
                        .font(.custom("Lato-Regular", size: 30))
                    +
                    Text("to stay in good price")
                        .font(.custom("Lato-Black", size: 30))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top,100)
                
            Spacer().frame(height: 30)

                
                
            ZStack {
                Image("board1")
                    .resizable()
                    .frame(height: DeviceHelper.isSmallScreen ? 450 : nil)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea(.all)
                
                Button {
                    path.append(AppRoute.onboarding2)
                } label: {
                    Text("Next")
                        .font(.custom("Lato-Regular", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 190,height: 54)
                        .background(Color("Color1"))
                        .cornerRadius(15)
                }
             
                
                .padding(.top, DeviceHelper.adaptivePadding(
                    small: 200,
                    medium: 420,
                    pro: 420,
                    proMax: 500
                ))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoarding1View(path: .constant(NavigationPath()))
}
