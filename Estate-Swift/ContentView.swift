//
//  ContentView.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/23/25.
//

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
    
    private func titleForSelectedTab() -> String {
        switch selectedTab {
        case .home: return "Home"
        case .search: return "Book"
        case .star: return "Favorites"
        case .user: return "User"
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: View based on selected tab
            Group {
                switch selectedTab {
                case .home:
                    Home()
                case .search:
                    Book()
                case .star:
                   Favorites()
                case .user:
                    UserPage()
                }
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 50)
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
            
            // Settings button with dynamic title
            HStack(spacing: -25) {
                Text(titleForSelectedTab())
                    .font(.custom("Lato-Black", size: 25))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .offset(y: -17)
            .offset(x: isSideBarOpen ? 100 : 0)
            .zIndex(1) // Ensure it stays above other views
            
            // OnboardingScreen with transition
            if showOnboarding {
                OnboardingScreen(path: $path)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .offset(y: showOnboarding ? -10 : 0)
                    .zIndex(2) // Onboarding screen should be above everything
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
