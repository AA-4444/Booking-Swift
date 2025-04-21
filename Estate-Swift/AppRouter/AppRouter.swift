//
//  AppRouter.swift
//  Estate-Swift
//
//  Created by Алексей Зарицький on 3/26/25.
//

import SwiftUI

enum AppRoute: Hashable {
    case onboardingview
    case login
    case register
    case loginemail
    case success(username: String)
    case setup
    case cards
    case main
}
