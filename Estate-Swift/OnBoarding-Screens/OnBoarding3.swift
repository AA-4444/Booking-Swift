//
//  OnBoarding3.swift
//  Estate
//
//  Created by Алексей Зарицький on 3/20/25.
//

import SwiftUI

struct OnBoarding3: View {
    var isSmallDevice: Bool {
           UIScreen.main.bounds.height < 700
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
            .padding(.top, DeviceHelper.isSmallScreen ? 60 : DeviceHelper.isMediumScreen ? 0 : 0)
          
            
                HStack {
                    Text("Find your perfect choice\n")
                        .font(.custom("Lato-Regular", size: 30))
                    +
                    Text("of your future house")
                        .font(.custom("Lato-Black", size: 30))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top,100)
                
            Spacer().frame(height: 30)
            
            ZStack {
                Image("board3")
                    .resizable()
                    .frame(height: DeviceHelper.isSmallScreen ? 450 : nil)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea(.all)
                
                HStack {
                    Button {
                       
                    } label: {
                        Image(systemName: "arrow.backward")
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 54, height: 54)
                            .background(Color.white)
                            .cornerRadius(25)
                    }
                    .frame(alignment: .leading)

            
                    Spacer().frame(width: DeviceHelper.adaptivePadding(
                        small: 20,
                        medium: 40,
                        pro: 40,
                        proMax: 60
                    ))

                    Button {
                        
                    } label: {
                        Text("Next")
                            .font(.custom("Lato-Regular", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 190, height: 54)
                            .background(Color("Color1"))
                            .cornerRadius(15)
                    }
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)


                 .padding(.top, DeviceHelper.adaptivePadding(
                    small: 200,
                    medium: 420,
                    pro: 420,
                    proMax: 500
                 ))
            }
            
        }
    }
}

#Preview {
    OnBoarding3()
}
