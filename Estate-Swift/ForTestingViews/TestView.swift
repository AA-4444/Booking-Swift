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
            Text("Email is alredy taken")
                .font(.custom("Lato-Regular", size: 14))
                .foregroundColor(.red)
                .padding(.horizontal)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

#Preview {
    TestView()
}
