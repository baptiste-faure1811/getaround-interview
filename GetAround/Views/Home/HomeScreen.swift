//
//  ContentView.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    @State private var viewModel: HomeViewModel = .init()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DesignSystem.spacing) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 270), alignment: .top)], spacing: DesignSystem.spacing, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(self.viewModel.cars) { car in
                            AppRouter.Link(value: .carDetails(car: car, numberOfDays: viewModel.selectedNumberOfDays)) {
                                CarCardWrapper(car: car, numberOfDays: viewModel.selectedNumberOfDays)
                            }
                        }
                    } header: {
                        DaysSelector(numberOfDays: $viewModel.selectedNumberOfDays.animation())
                            .frame(maxWidth: 400, alignment: .center)
                    }
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
        .background(.background100)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                GetaroundToolBar()
            }
        }
        .safeAreaPadding(.top)
        .errorAlert(error: $viewModel.fetchError)
        .refreshable {
            // Realod cars on refresh
            await self.viewModel.loadCars()
        }
        // Using a custom view modifier otherwise the task is triggered when poping back from detail view.
        .onFirstAppearTask {
            await self.viewModel.loadCars()
        }
        // Animates overlays appearance and disappearance.
        .animation(.spring, value: viewModel.cars)
    }
}
