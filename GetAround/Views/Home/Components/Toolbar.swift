//
//  Toolbar.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct GetaroundToolBar: View {
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
