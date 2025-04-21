//
//  ContentView.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//

import GoogleSignIn


// struct ContentView: View {
    //@Binding var user: User?
  //  var body: some View {
      //  if let user {
        //    Text("Hello there, \(user.name)")
          //  Button {
            //    GIDSignIn.sharedInstance.signOut()
              //  self.user = nil
            //} label: {
              //  Text("Log out")
            //}
        //} else {
         //   Login(user: self.$user ,path: .constant(NavigationPath()))
        //}
   // }
//}

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @Binding var user: User?
    @Binding var path: NavigationPath
    @State private var showOnboarding = false
    @State private var isSideBarOpen = false
    var menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            // Background color
            
            
            // SideBar (similar to SideMenu in the example)
            SideBar()
                .padding(.top, 50)
                .opacity(isSideBarOpen ? 1 : 0)
                .offset(x: isSideBarOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isSideBarOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
            
                .ignoresSafeArea(.all, edges: .top)
            
            
            
            // Main content (Home view)
            Home()
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 112)
                }
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .rotation3DEffect(.degrees(isSideBarOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
                .offset(x: isSideBarOpen ? 265 : 0)
                .scaleEffect(isSideBarOpen ? 0.9 : 1)
                .scaleEffect(showOnboarding ? 0.92 : 1)
                .ignoresSafeArea()
                
            
            
            // NavBar (similar to TabBar in the example)
            NavBar()
                .offset(y: -24)
               
                .ignoresSafeArea()
                .offset(y: isSideBarOpen ? 300 : 0)
                .offset(y: showOnboarding ? 200 : 0)
            
            // Menu button with Rive animation
            menuButton.view()
                .frame(width: 44, height: 44)
                .background(
                        Circle()
                            .fill(Color.white) // Background circle color
                            .frame(width: 50, height: 50) // Larger circle size
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    )
                
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isSideBarOpen ? 216 : 0)
                .onTapGesture {
                    menuButton.setInput("isOpen", value: isSideBarOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isSideBarOpen.toggle()
                    }
                }
                .onChange(of: isSideBarOpen) { newValue in
                    if newValue {
                        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
                    } else {
                        UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    }
                }
                .offset(y: -15)
            
            // Profile button to show OnboardingScreen
            Image(systemName: "person")
                .frame(width: 40, height: 40)
                .background(
                        Circle()
                            .fill(Color.white) // Background circle color
                            .frame(width: 50, height: 50) // Larger circle size
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    )
                
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                
                .padding()
                .offset(y: 4)
                .offset(x: isSideBarOpen ? 100 : 0)
                .offset(y: -15)
                .onTapGesture {
                    
                }
            
            // OnboardingScreen with transition
            if showOnboarding {
                OnboardingScreen(path: $path)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .offset(y: showOnboarding ? -10 : 0)
                    .zIndex(1)
                    .transition(.move(edge: .top))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: .constant(User(name: "Test User")), path: .constant(NavigationPath()))
    }
}
