//
//  PrivacyPolicy.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 5/20/25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Binding var path: NavigationPath
    let policyText = """
    ESTATE RENTAL APP
    --------------------------
    PRIVACY POLICY

    Effective: May 20, 2025

    1. DATA COLLECTION
    We collect personal data such as:
    - Name
    - Email & Phone Number
    - ID Verification (if required)
    - Rental Preferences
    - Payment Info (via secure providers)

    2. USAGE OF DATA
    Your data is used to:
    - Process bookings
    - Communicate with you
    - Verify your identity
    - Comply with laws

    3. DATA SHARING
    We do NOT sell your data.
    We may share info with:
    - Trusted payment processors
    - Legal authorities (if required)

    4. DATA SECURITY
    All data is stored securely.
    We use encryption & strict
    access controls.

    5. USER RIGHTS
    You may:
    - Request data access
    - Request deletion
    - Opt-out of marketing

    6. COOKIES & TRACKING
    We use cookies to enhance
    user experience and analyze
    app performance.

    7. LEGAL COMPLIANCE
    We follow GDPR, CCPA, and
    other relevant privacy laws.

    --------------------------
    YOUR PRIVACY MATTERS TO US
    For questions, email:
    privacy@estateapp.com
    --------------------------
    """


    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                
                Spacer()
                
                Text("Privacy Policy")
                    .font(.custom("Lato-Black", size: 25))
                    .foregroundColor(.black)
                
                Spacer()
                
                // Placeholder to balance
                Color.clear
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
             
            ScrollView {
                VStack {
                    Spacer(minLength: 20)
                    
                    Text(policyText)
                        .multilineTextAlignment(.center)
                        .font(.system(.body, design: .monospaced))
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    
                    Spacer(minLength: 20)
                }
                .frame(maxWidth: .infinity)
                
            }
           //.background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
           
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    PrivacyPolicyView(path: .constant(NavigationPath()))
}
