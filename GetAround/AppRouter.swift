//
//  AppRouter.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Observation
import SwiftUI

/*

 This AppRouter is not very useful in the case of this app. I am using it in one of my other apps.
 I chose to use it only to showcase what I would do to manage navigation in a bigger app.
 When using UIKit, I like to use the Coordinator pattern, this AppRouter allows to get closer to that concept, event though not ideal.
 This allows to retrieve a `path` var using environment to have programatic navigation and typed destinations

 */

@Observable
final class AppRouter {
    var path: NavigationPath = .init()

    public func pop(_ count: Int = 1) {
        guard count <= path.count else {
            path = NavigationPath()
            return
        }
        path.removeLast(count)
    }

    public func push(_ destination: Destination) {
        path.append(destination)
    }

    struct Link<Content: View>: View {
        let value: Destination
        @ViewBuilder let content: () -> Content

        var body: some View {
            NavigationLink(value: value, label: content)
                .buttonStyle(.plain)
        }
    }
}

enum Destination: Hashable {
    case carDetails(car: Car, numberOfDays: Int)
}

struct SetRouterDestinations: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .carDetails(let car, let numberOfDays):
                    CarDetailsScreen(car: car, numberOfDays: numberOfDays)
                }
            }
    }
}

extension View {
    func configureRouterDestinations() -> some View {
        modifier(SetRouterDestinations())
    }
}
