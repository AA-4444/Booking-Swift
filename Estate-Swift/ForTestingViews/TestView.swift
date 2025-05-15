//
//  TestView.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 4/24/25.
//
// Testing views file
import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Email is alredy taken")
                        .font(.custom("Lato-Regular", size: 18))
                        .foregroundColor(.red)
                       
                        
                    
                    Image(systemName: "exclamationmark.circle", variableValue: 1.00)
                        
                        .foregroundColor(Color.red)
                        .font(.system(size: 25, weight: .regular))
                       
                }
                .padding(.horizontal,25)
                .padding(.vertical, 25)
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray,radius: 10, x: 0, y: 5)
        }
    }
}

#Preview {
    TestView()
}
