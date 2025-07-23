//
//  RoomView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct RoomView: View {
       
    @Binding var devices: [SmartDevice]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    ForEach(RoomType.allCases) { roomType in
                        let filteredDevices = $devices.filter { $0.roomType.wrappedValue == roomType }
                        
                        if !filteredDevices.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                // Raumtitel mit Icon
                                HStack(spacing: 8) {
                                    Image(systemName: roomType.iconName)
                                        .foregroundColor(.blue)
                                    Text(roomType.rawValue)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                }
                                .padding(.horizontal)
                            
                                LazyVGrid(
                                    columns: [GridItem(.adaptive(minimum: 175), spacing: 16)],
                                    spacing: 16
                                ) {
                                    ForEach(filteredDevices) { device in
                                        RoomItemView(device: device)
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
                #if DEBUG
                .animation(nil, value: devices)
                #else
                .animation(.default, value: devices)
                #endif
            }
        }
    }
}

//#Preview {
//    RoomView()
//}
