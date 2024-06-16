//
//  LoadingOverlay.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI
import SwiftUIGIF

struct LoadingOverlay: View {
    var body: some View {
        ContentUnavailableView {
            Label(title: {
                Text("Searching cars ...")
            }, icon: {
                GIFImage(name: "car-loading")
                    .frame(height: 56)
            })
        } description: {
            Text("We're searching available cars around you")
        }
    }
}

struct EmptyOverlay: View {
    public let retryAction: () async -> Void
    var body: some View {
        ContentUnavailableView(label: {
            Label("No Cars Available", systemImage: "car.2")
        }, description: {
            Text("We couldn't find any cars around you.")
        }, actions: {
            Button {
                Task(priority: .userInitiated) {
                    await retryAction()
                }
            } label: {
                Text("Reload")
            }
            .buttonStyle(.bordered)
            .tint(.accent)
        })
    }
}

struct ErrorOverlay: View {
    public let localizedError: LocalizedError
    public let retryAction: () async -> Void
    var body: some View {
        ContentUnavailableView(label: {
            Label(localizedError.errorDescription ?? "An error occured", systemImage: "exclamationmark.triangle")
        }, description: {
            Text(localizedError.recoverySuggestion ?? "")
        }, actions: {
            Button {
                Task(priority: .userInitiated) {
                    await retryAction()
                }
            } label: {
                Text("Reload")
            }
            .buttonStyle(.bordered)
            .tint(.accent)
        })
    }
}
