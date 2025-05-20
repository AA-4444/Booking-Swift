//
//  Settings.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 5/4/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var path: NavigationPath
    var body: some View {
       
           
                VStack(spacing: 0) {
                    Button(action: {
                                      // Pop the last view in the path stack
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
                                  .frame(maxWidth: .infinity,alignment: .leading)
                                  .padding(.horizontal)
                 
                    ScrollView(showsIndicators: false){
                        // Payment Info Section..
                        sectionHeader("PAYMENT INFO")
                        sectionRow(icon: "creditcard", title: "Rewards & Wallet")
                        sectionRow(icon: "creditcard.fill", title: "Payment methods")
                        //    .onTapGesture {
                                
                        //    }
                        
                        // Manage Account Section..
                        sectionHeader("MANAGE ACCOUNT")
                        sectionRow(icon: "person", title: "Personal details")
                        sectionRow(icon: "lock", title: "Security settings")
                        sectionRow(icon: "person.2", title: "Other travelers")
                        
                        // Preferences Section..
                        sectionHeader("PREFERENCES")
                        sectionRow(icon: "gearshape", title: "Device preferences")
                            .onTapGesture {
                        path.append(AppRoute.devicepref)
                           }

                        sectionRow(icon: "slider.horizontal.3", title: "Travel preferences")
                            .onTapGesture {
                        path.append(AppRoute.travelpref)
                           }
                        sectionRow(icon: "envelope", title: "Email preferences")
                            .onTapGesture {
                        path.append(AppRoute.emailpref)
                           }
                        
                        // Travel Activity Section..
                        sectionHeader("TRAVEL ACTIVITY")
                        sectionRow(icon: "heart", title: "Saved lists")
                        
                        // Payment Info Section..
                        sectionHeader("SUPPORT")
                        sectionRow(icon: "bubble.left.and.bubble.right", title: "FAQ")
                            .onTapGesture {
                        path.append(AppRoute.faq)
                           }
                        
                        sectionRow(icon: "tray.full.fill", title: "Most recent questions")
                        
                        //Policy
                        sectionHeader("Privacy Policy")
                        sectionRow(icon: "hand.raised", title: "Privacy Policy")
                            .onTapGesture {
                        path.append(AppRoute.privacypolicy)
                           }
                    }
                    Spacer()
                }
                .background(Color(.systemGroupedBackground))
            
           
           // .navigationTitle("")
            .navigationBarBackButtonHidden(true)
        
    }
    
   
    
    //Header part
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    //MARK: Section Row with Icon, Title, and Chevron
    private func sectionRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(path: .constant(NavigationPath()))
    }
}
