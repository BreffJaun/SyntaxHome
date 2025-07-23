//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct DeviceListView: View {
    
    @Binding var devices: [SmartDevice]

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea() // Damit’s bis unter Status Bar und Bottom Edge geht

            ScrollView {
                VStack(spacing: 16) {
                    ForEach($devices) { device in
                        DeviceItemView(device: device)
                        Divider()
                            .frame(height: 0.25)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    DeviceListView()
//}

