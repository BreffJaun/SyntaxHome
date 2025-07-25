//
//  TypesView.swift
//  SyntaxHome
//
//  Created by Jeff Braun on 25.07.25.
//

import SwiftUI

import SwiftUI

struct TypesView: View {
    
    @Binding var devices: [SmartDevice]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(DeviceType.allCases) { deviceType in
                        let filteredDevices = $devices.filter { $0.deviceType.wrappedValue == deviceType }
                        
                        if !filteredDevices.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 8) {
                                    Image(systemName: deviceType.iconName)
                                        .foregroundColor(.blueCustom)
                                    Text(deviceType.rawValue.capitalized)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                }
                                .padding(.horizontal)
                                
                                LazyVGrid(
                                    columns: [GridItem(.adaptive(minimum: 175), spacing: 16)],
                                    spacing: 16
                                ) {
                                    ForEach(filteredDevices) { device in
                                        TypeItemView(device: device)
                                    }
                                }
                                .padding(.horizontal)
                                
                                Divider()
                                    .padding(.horizontal, 16)
                                    .frame(height: 0.25)
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
            }
        }
    }
}


//#Preview {
//    TypesView()
//}
