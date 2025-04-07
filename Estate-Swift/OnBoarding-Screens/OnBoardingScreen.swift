//
//  test.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 4/3/25.
//

import SwiftUI

struct OnboardingScreen: View {
    @State private var isAnimating = false
    @State private var showContinueText = false
    @Binding var path: NavigationPath
    
    // Function to calculate dynamic font size based on screen width
    func dynamicFontSize(for text: String, screenWidth: CGFloat) -> CGFloat {
        let baseFontSize: CGFloat = 120
        let textWidth = text.widthOfString(usingFont: .systemFont(ofSize: baseFontSize))
        let scaleFactor = screenWidth / textWidth
        let adjustedFontSize = baseFontSize * min(scaleFactor, 1.0) // Avoid scaling up too much
        return adjustedFontSize
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background with custom Color2
                Color("Color2")
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Spacer() // Push content to the bottom
                    
                    // Main title with splash animation, full width, aligned at bottom
                    VStack(spacing: 0) {
                        Text("VEST")
                            .font(.custom("Lato-Black", size: dynamicFontSize(for: "VEST", screenWidth: geometry.size.width)))
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.0 : 0.1) // Scale from small to full size
                            .rotationEffect(.degrees(isAnimating ? 0 : 360)) // Rotate 360 degrees
                            .opacity(isAnimating ? 1.0 : 0.0) // Fade in
                            .animation(
                                .spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0)
                                .delay(0.3), // Delay for the first text
                                value: isAnimating
                            )
                            .frame(maxWidth: .infinity, alignment: .leading) // Full width, centered
                        
                        Text("ESTATE")
                            .font(.custom("Lato-Black", size: dynamicFontSize(for: "ESTATE", screenWidth: geometry.size.width)))
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.0 : 0.1) // Scale from small to full size
                            .rotationEffect(.degrees(isAnimating ? 0 : -360)) // Rotate in opposite direction
                            .opacity(isAnimating ? 1.0 : 0.0) // Fade in
                            .animation(
                                .spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0)
                                .delay(0.6), // Delay for the second text
                                value: isAnimating
                            )
                            .frame(maxWidth: .infinity, alignment: .leading) // Full width, centered
                        
                        Text("Agency")
                            .font(.custom("Lato-Black", size: dynamicFontSize(for: "Agency", screenWidth: geometry.size.width)))
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.0 : 0.1) // Scale from small to full size
                            .rotationEffect(.degrees(isAnimating ? 0 : 360)) // Rotate 360 degrees
                            .opacity(isAnimating ? 1.0 : 0.0) // Fade in
                            .animation(
                                .spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0)
                                .delay(0.9), // Delay for the third text
                                value: isAnimating
                            )
                            .frame(maxWidth: .infinity, alignment: .leading) // Align to the left if it doesn't fit full width
                    }
                    
                    // Tap to continue text with fade-in animation
                    Text("Tap on screen to continue")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white.opacity(showContinueText ? 0.8 : 0.0))
                        .opacity(showContinueText ? 1.0 : 0.0)
                        .animation(
                            .easeInOut(duration: 1.0)
                            .delay(1.5), // Delay to appear after main text animation
                            value: showContinueText
                        )
                        .padding(.top,15)
                        .padding(.bottom, 30) // Adjusted padding for bottom alignment
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .onAppear {
                // Trigger the splash animation when the view appears
                isAnimating = true
                showContinueText = true
            }
            .onTapGesture {
                // Add your tap action here
                path.append(AppRoute.login)
            }
        }
    }
}

// Extension to calculate the width of a string for dynamic font sizing
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(path: .constant(NavigationPath()))
    }
}
