//
//  start.swift
//  Estate
//
//  Created by Алексей Зарицький on 3/18/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            
            //bg
            Image("start")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            LinearGradient(
                          gradient: Gradient(colors: [
                              Color.black.opacity(0.65),
                              //Color.clear
                          ]),
                          startPoint: .bottom,
                          endPoint: .top
                      )
                      .ignoresSafeArea(.all)
            
            VStack {
                VStack() {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                //    Spacer().frame(height: 10)
                    
                    Text("Vest EState")
                        .font(.custom("Lato-Black", size: 46))
                        .foregroundColor(.white)
                        .padding(.top,-85)
                       
                        
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("Let's Start")
                            .foregroundColor(.white)
                            .font(.custom("Lato-Bold",size: 20))
                            .frame(width: 190, height: 54)
                            .background(Color("Color1"))
                            .cornerRadius(15)
                    }
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Made with")
                            .font(.custom("Lato-Regular", size: 18))
                            .foregroundColor(.white)
                        
                        Image(systemName: "heart")
                            .symbolVariant(.none)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                
                }

               // .padding(.bottom,50)
                .padding(.bottom, DeviceHelper.isSmallScreen ? 105 : DeviceHelper.isMediumScreen ? 42 : 42)
                
                    
            }

        }
    }
}

#Preview {
    StartView()
}
