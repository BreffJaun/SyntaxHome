//
//  HeaderView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var devices: [SmartDevice]
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colorScheme) var systemColorScheme
    @Environment(\.scenePhase) var scenePhase
    
    @State private var showSettings = false

//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            Text("Syntax Home")
//                .font(.title)
//                .bold()
//                .padding(.horizontal, 8)
//
//            AddDeviceView(devices: $devices)
//                .padding(.vertical)
//        }
//        .padding(8)
//        .frame(height: 200)
//        .frame(maxWidth: .infinity, alignment: .topLeading)
//        
//        Divider()
//            .frame(height: 0.25)
//            .background(Color.white)
//            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
//    }
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Syntax Home")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundStyle(.tealCustom)
                    }
                }
                .padding(.horizontal, 8)

                AddDeviceView(devices: $devices)
                    .padding(.vertical)
            }
            .padding(8)
            .frame(height: 200)
            .frame(maxWidth: .infinity, alignment: .topLeading)

            Divider()
                .frame(height: 0.25)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
            
            .sheet(isPresented: $showSettings) {
                SettingsSheetView()
            }
        }
}


//#Preview {
//    HeaderView()
//}
