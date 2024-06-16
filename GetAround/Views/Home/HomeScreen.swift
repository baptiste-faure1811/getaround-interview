//
//  ContentView.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI
import SwiftUIGIF

struct HomeScreen: View {
    @State private var viewModel: HomeViewModel = .init()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DesignSystem.spacing) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 270), alignment: .top)],
                          spacing: DesignSystem.spacing, 
                          pinnedViews: [.sectionHeaders])
                {
                    Section(content: {
                        ForEach(self.viewModel.cars) { car in
                            CarCardView(car: car, numberOfDays: viewModel.selectedNumberOfDays)
                        }
                    }, header: {
                        DaysSelector(numberOfDays: $viewModel.selectedNumberOfDays.animation())
                            .frame(maxWidth: 400, alignment: .center)
                    })
                }
                if viewModel.cars.isEmpty, !viewModel.isFetchingCars, viewModel.fetchError == nil {
                    EmptyOverlay(retryAction: viewModel.loadCars)
                }
                if viewModel.isFetchingCars {
                    LoadingOverlay()
                }
                if let fetchError = viewModel.fetchError, !viewModel.isFetchingCars {
                    ErrorOverlay(localizedError: fetchError, retryAction: viewModel.loadCars)
                }
            }
            .padding(.horizontal, DesignSystem.spacing)
            .padding(.bottom, DesignSystem.spacing)
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                GetaroundToolBar()
            }
        }
        .safeAreaPadding(.top)
        .errorAlert(error: $viewModel.fetchError)
        .refreshable {
            await self.viewModel.loadCars()
        }
        .task {
            await self.viewModel.loadCars()
        }
        .animation(.default, value: viewModel.cars)
    }
}

private struct GetaroundToolBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(.roundedAppIcon)
                .resizable()
                .frame(width: 26, height: 26)
            Text(Constants.AppName)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

private struct DaysSelector: View {
    @Binding public var numberOfDays: Int
    var body: some View {
        Card(spacing: 0) {
            Group {
                Text("Showing prices for:")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fontWeight(.medium)

                // Using the iOS 17 'Grammar Agreement' to automatically handle plurals.
                // 'day' needs to be string interpolated.
                // See: https://www.hackingwithswift.com/forums/swiftui/odd-log-message-caused-by-automatic-grammar-agreement/20614
                Stepper("^[\(numberOfDays) \("day")](inflect: true)",
                        value: $numberOfDays.animation(),
                        in: 1 ... 31,
                        step: 1)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .sensoryFeedback(.increase, trigger: numberOfDays)
            }
            .animation(.spring, value: numberOfDays)
            .contentTransition(.numericText())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}

private struct LoadingOverlay: View {
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

private struct EmptyOverlay: View {
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

private struct ErrorOverlay: View {
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
