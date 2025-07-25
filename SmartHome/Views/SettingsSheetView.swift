//
//  SettingsSheetView.swift
//  SyntaxHome
//
//  Created by Jeff Braun on 25.07.25.
//

import SwiftUI

struct SettingsSheetView: View {
//    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .tint(.tealCustom)
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


//#Preview {
//    SettingsSheetView()
//}
