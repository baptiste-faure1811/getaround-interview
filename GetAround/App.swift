//
//  GetAroundApp.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI
import UIKit

@main
struct GetAroundApp: App {
    @State private var router: AppRouter = .init()

    init() {
        // This lines is used to make the SwiftUI alerts use the accent color as their .tintColor, otherwwise it uses the default iOS blue color.
        // SwiftUI alert use UIAlertController behind the scenes.
        // There is no way to set the .tintColor directly in SwiftUI, and using the .tint view modifier does not work.
        DispatchQueue.main.async {
            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .accent
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreen()
                    .configureRouterDestinations()
            }
            .environment(router)
            .tint(.accent)
        }
    }
}
