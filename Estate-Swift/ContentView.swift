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
import GoogleSignIn

struct ContentView: View {
    @Binding var user: User?
    @Binding var path: NavigationPath
    @State private var showOnboarding = false
    @State private var isSideBarOpen = false
    @AppStorage("selectedTab") var selectedTab: NabTab = .home
    var menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    let SettingsIcon = RiveViewModel(
        fileName: "black_icons",
        stateMachineName: "SETTINGS_Interactivity",
        autoPlay: false,
        artboardName: "SETTINGS"
    )
    
    var body: some View {
        ZStack {
            // Sidebar
            SideBar()
                .padding(.top, 50)
                .opacity(isSideBarOpen ? 1 : 0)
                .offset(x: isSideBarOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isSideBarOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                .ignoresSafeArea(.all, edges: .top)
            
            //MARK: View based on selected tab...
            Group {
                switch selectedTab {
                case .home:
                    Home()
                case .search:
                    Text("Search View")
                case .star:
                    Text("Favorites View")
                case .user:
                    UserPage()
                }
            }
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
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                    case .settings:
                        SettingsView(path: $path)
                    default:
                        EmptyView()
                }
            }
            
            // NavBar
            NavBar()
                .offset(y: -24)
                .ignoresSafeArea()
                .offset(y: isSideBarOpen ? 300 : 0)
                .offset(y: showOnboarding ? 200 : 0)
            
            // Menu button
            menuButton.view()
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
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
            
          // Settings button
            SettingsIcon.view()
                .frame(width: 38, height: 38)
                .onTapGesture {
                    path.append(AppRoute.settings)
                    SettingsIcon.setInput("active", value: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        SettingsIcon.setInput("active", value: false)
                    }
                }
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .offset(y: 4)
                .offset(x: isSideBarOpen ? 100 : 0)
                .offset(y: -15)
              
                
            
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

