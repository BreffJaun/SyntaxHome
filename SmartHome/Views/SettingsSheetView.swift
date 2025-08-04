//
//  SettingsSheetView.swift
//  SyntaxHome
//
//  Created by Jeff Braun on 25.07.25.
//

import SwiftUI

struct SettingsSheetView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .tint(.tealCustom)
            }
            .navigationTitle("Settings")
        }
    }
}


//#Preview {
//    SettingsSheetView()
//}


