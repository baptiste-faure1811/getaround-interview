//
//  Constants.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation

enum Constants {
    public static let CarsEndpoints: String = "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json"
    public static let AppName: String = "Getaround"
}

enum DesignSystem {
    enum CardCornerRadius {
        public static let large: CGFloat = 16
        public static let small: CGFloat = 10
    }

    enum CardPadding {
        public static let large: CGFloat = 8
        public static let small: CGFloat = 10
    }

    public static let strokeWidth: CGFloat = 1
    public static let imageAspectRatio: CGFloat = 16 / 10
    public static let spacing: CGFloat = 16
}
