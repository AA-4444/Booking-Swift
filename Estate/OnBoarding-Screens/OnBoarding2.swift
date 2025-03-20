//
//  OnBoarding2.swift
//  Estate
//
//  Created by Алексей Зарицький on 3/20/25.
//

import SwiftUI

struct DeviceHelper {
    static let screenHeight = UIScreen.main.bounds.height
    
    static var isSmallScreen: Bool {
        return screenHeight < 700 // iPhone SE, 8, etc.
    }
    
    static var isMediumScreen: Bool {
        return screenHeight >= 700 && screenHeight < 850 // iPhone 11, 12, 13, 14, 15
    }
    
    static var isProScreen: Bool {
        return screenHeight >= 850 && screenHeight < 900 // iPhone 14 Pro, 15 Pro
    }
    
    static var isProMaxScreen: Bool {
        return screenHeight >= 900 // iPhone 14 Pro Max, 15 Pro Max, 16 Pro Max
    }

    //MARK: Reusable Padding Function
    static func adaptivePadding(small: CGFloat, medium: CGFloat, pro: CGFloat, proMax: CGFloat, fallback: CGFloat = 420) -> CGFloat {
        if isSmallScreen {
            return small
        } else if isMediumScreen {
            return medium
        } else if isProScreen {
            return pro
        } else if isProMaxScreen {
            return proMax
        } else {
            return fallback
        }
    }
}



struct OnBoarding2: View {
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
                    Text("Fast sell your property\n")
                        .font(.custom("Lato-Regular", size: 30))
                    +
                    Text("in just one click")
                        .font(.custom("Lato-Black", size: 30))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top,100)
                
            Spacer().frame(height: 30)
            
            ZStack {
                Image("board2")
                    .resizable()
                    .frame(height: DeviceHelper.isSmallScreen ? 450 : nil)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea(.all)
                
                Button {
                    
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
    }
}

#Preview {
    OnBoarding2()
}
