//
//  RoomView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct RoomView: View {
       
    @Binding var devices: [SmartDevice]
    
    private var groupedDevices: [RoomType: [Binding<SmartDevice>]] {
        Dictionary(
            grouping: $devices,
            by: { $0.roomType.wrappedValue }
        )
    }
    
    private var sortedRoomTypes: [RoomType] {
        groupedDevices.keys.sorted { $0.rawValue < $1.rawValue }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    ForEach(sortedRoomTypes, id: \.self) { roomType in
                        VStack(alignment: .leading, spacing: 12) {
                            // Raum-Überschrift mit Icon
                            HStack(spacing: 8) {
                                Image(systemName: roomType.iconName)
                                    .foregroundColor(.blue)
                                Text(roomType.rawValue)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .padding(.horizontal)

                            // Liste der Devices in diesem Raum
                            VStack(spacing: 8) {
                                ForEach(groupedDevices[roomType] ?? [], id: \.wrappedValue.id) { device in
                                    DeviceItemView(device: device)
                                    Divider().frame(height: 0.25)
                                }
                            }
                            .background(Color("BackgroundColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical, 20)
            }
        }
    }
}

//#Preview {
//    RoomView()
//}
