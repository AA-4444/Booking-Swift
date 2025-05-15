//
//  FAQ.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/26/25.
//

import SwiftUI

struct FAQ: View {
    @State private var searchText: String = ""
    @State private var selectedOption: String = "Buyer"
    @State private var expandedQuestion: String? = nil
    

        let options = ["Buyer", "Estate Agent"]
    
    var body: some View {
        VStack {
            
            HStack(spacing: 5) {
                Text("FAQ")
                    .font(.custom("Lato-Black", size: DeviceHelper.adaptivePadding(
                        small: 27,
                        medium: 32,
                        pro: 32,
                        proMax: 33
                    )))
                    .foregroundColor(.black)
                
                
                Text("&")
                    .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                        small: 27,
                        medium: 30,
                        pro: 30,
                        proMax: 31
                    )))
                    .foregroundColor(.gray)
                    
                
                   
                
                Text("Support")
                    .font(.custom("Lato-Black", size: DeviceHelper.adaptivePadding(
                        small: 27,
                        medium: 32,
                        pro: 32,
                        proMax: 33
                    )))
                    .foregroundColor(.black)
                    
                    
                   // .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            
            Spacer().frame(height: 20)
            
            Text("Find answer to your problem ")
                .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                    small: 19,
                    medium: 20,
                    pro: 22,
                    proMax: 22
                )))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
                
            //options...
            VStack {
                
                HStack {
                    Image(systemName: "globe")
                    
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .regular))
                    .background(
                        Color("Color2")
                            .cornerRadius(50)
                            .frame(width: 40,height: 40)
                    )
                    
                    
                    Spacer().frame(width: 20)
                    
                    Text("Visit our website")
                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                            small: 19,
                            medium: 20,
                            pro: 22,
                            proMax: 22
                        )))
                    
                   
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,30)
                .padding(.top,10)
                
                Divider()
                    .frame(width: .infinity,height: 2)
                    .background(Color.gray.opacity(0.3))
                    .padding(.horizontal,30)
                    .padding(.top,10)
                
                HStack {
                    Image(systemName: "envelope")
                    
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .regular))
                    .background(
                        Color("Color2")
                            .cornerRadius(50)
                            .frame(width: 40,height: 40)
                    )
                    
                    
                    Spacer().frame(width: 20)
                    
                    Text("Email us")
                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                            small: 19,
                            medium: 20,
                            pro: 22,
                            proMax: 22
                        )))
                    
                   
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,30)
                .padding(.top,10)
                
                Divider()
                    .frame(width: .infinity,height: 2)
                    .background(Color.gray.opacity(0.3))
                    .padding(.horizontal,30)
                    .padding(.top,10)
                
                HStack {
                    Image(systemName: "text.alignleft")
                    
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .regular))
                    .background(
                        Color("Color2")
                            .cornerRadius(50)
                            .frame(width: 40,height: 40)
                    )
                    
                    
                    Spacer().frame(width: 20)
                    
                    Text("Terms of Service")
                        .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                            small: 19,
                            medium: 20,
                            pro: 22,
                            proMax: 22
                        )))
                    
                   
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,30)
                .padding(.top,10)
               
                  
            }
            .padding(.top,20)
            
            HStack {
                      Image(systemName: "magnifyingglass")
                          .foregroundColor(.gray)
                          .padding(.leading,20)
                      
                      TextField("Try find “how to”", text: $searchText)
                          .foregroundColor(.black)
                          .disableAutocorrection(true)
                  }
                  .frame(width: 327, height: 70)
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(15)
                  .padding(.horizontal)
                  .padding(.top,20)
            
         
            HStack {
                       ForEach(options, id: \.self) { option in
                           Text(option)
                               .foregroundColor(selectedOption == option ? .black : .gray)
                               .font(.system(size: 18, weight: .bold))
                               .frame(maxWidth: 150, minHeight: 52)
                               .background(
                                   ZStack {
                                       if selectedOption == option {
                                           RoundedRectangle(cornerRadius: 50)
                                               .fill(Color.white)
                                       }
                                   }
                               )
                               .clipShape(RoundedRectangle(cornerRadius: 15))
                               .onTapGesture {
                                   withAnimation {
                                       selectedOption = option
                                   }
                               }
                       }
                   }
            .frame(width: 327, height: 70)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(.horizontal)
            
            VStack {
                         
                          if selectedOption == "Buyer" {
                              VStack {
                                  HStack {
                                      Text("What is Vest Real Estate?")
                                          .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                              small: 15,
                                              medium: 17,
                                              pro: 17,
                                              proMax: 18
                                          )))

                                      Spacer().frame(width: 90)

                                      Button {
                                          withAnimation {
                                        expandedQuestion =
                                        expandedQuestion == "BuyerQuestion1" ? nil : "BuyerQuestion1"
                                                                         }
                                      } label: {
                                          Image(systemName: expandedQuestion == "BuyerQuestion1" ? "minus" : "plus")
                                              .foregroundColor(Color("Color2"))
                                              .font(.system(size: 20))
                                      }
                                  }
                                  
                                  Spacer().frame(height: 15)

                                  
                                  if expandedQuestion == "BuyerQuestion1" {
                                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                          .padding()
                                          .background(Color.gray.opacity(0.2))
                                          .cornerRadius(10)
                                          .padding(.top, 10)
                                  }

                                  HStack {
                                      Text("Why choose buy in Vest")
                                          .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                              small: 15,
                                              medium: 17,
                                              pro: 17,
                                              proMax: 18
                                          )))

                                      Spacer().frame(width: 100)

                                      Button {
                                        withAnimation {
                                    expandedQuestion = expandedQuestion == "BuyerQuestion2" ? nil : "BuyerQuestion2"
                                                                          }
                                      } label: {
                                          Image(systemName: expandedQuestion == "BuyerQuestion2" ? "minus" : "plus")
                                              .foregroundColor(Color("Color2"))
                                              .font(.system(size: 20))
                                      }
                                      
                                    
                                      
                                     
                                  }
                                  
                                  Spacer().frame(height: 15)

                                                        if expandedQuestion == "BuyerQuestion2" {
                                                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                                                .padding()
                                                                .background(Color.gray.opacity(0.2))
                                                                .cornerRadius(10)
                                                                .padding(.top, 10)
                                                        }
                              }
                          } else if selectedOption == "Estate Agent" {
                              VStack {
                                  HStack {
                                      Text("Why Vest Estate for  Agents?")
                                          .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                              small: 15,
                                              medium: 17,
                                              pro: 17,
                                              proMax: 18
                                          )))

                                      Spacer().frame(width: 75)

                                      Button {
                                          withAnimation {
                                        expandedQuestion = expandedQuestion == "EstateAgentQuestion1" ? nil : "EstateAgentQuestion1"
                                                                        }
                                      } label: {
                                          Image(systemName: expandedQuestion == "EstateAgentQuestion1" ? "minus" : "plus")
                                              .foregroundColor(Color("Color1"))
                                              .font(.system(size: 20))
                                      }
                                  }

                                  Spacer().frame(height: 15)
                                  
                                  if expandedQuestion == "EstateAgentQuestion1" {
                                                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                                                .padding()
                                                                .background(Color.gray.opacity(0.2))
                                                                .cornerRadius(10)
                                                                .padding(.top, 10)
                                                        }

                                  HStack {
                                      Text("Why E Agents prefer Vest")
                                          .font(.custom("Lato-Regular", size: DeviceHelper.adaptivePadding(
                                              small: 15,
                                              medium: 17,
                                              pro: 17,
                                              proMax: 18
                                          )))

                                      Spacer().frame(width: 100)

                                      Button {
                                          withAnimation {
                                                                             expandedQuestion = expandedQuestion == "EstateAgentQuestion2" ? nil : "EstateAgentQuestion2"
                                                                         }
                                      } label: {
                                          Image(systemName: expandedQuestion == "EstateAgentQuestion2" ? "minus" : "plus")
                                              .foregroundColor(Color("Color1"))
                                              .font(.system(size: 20))
                                      }
                                  }
                                  
                                  Spacer().frame(height: 15)

                                                         if expandedQuestion == "EstateAgentQuestion2" {
                                                             Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                                                 .padding()
                                                                 .background(Color.gray.opacity(0.2))
                                                                 .cornerRadius(10)
                                                                 .padding(.top, 10)
                                                         }
                              }
                          }
                      }
                      .padding(.top, 20)
        }
       // .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    FAQ()
}
