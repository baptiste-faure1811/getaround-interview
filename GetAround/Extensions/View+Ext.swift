//
//  View+Ext.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

extension View {
    
    // This extension allows to present an alert to the user when an error Binding is not nil.
    func errorAlert(error: Binding<FetchErrors?>, action: @escaping () -> Void = {}) -> some View {
        return alert(isPresented: .constant(error.wrappedValue != nil), error: error.wrappedValue) { _ in
            Button("OK", action: action)
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}
