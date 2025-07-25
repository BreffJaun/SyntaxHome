//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct DeviceListView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var devices: [SmartDevice]
    @State private var selectedDevice: SmartDevice?

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea() // => turns the complete background in this color

            List {
                ForEach($devices) { device in
                    DeviceItemView(device: device)
                        .listRowBackground(Color("BackgroundColor"))
//                        .listRowSeparatorTint(Color.white.opacity(0.15))
                        .listRowSeparatorTint(
                            colorScheme == .dark
                                ? Color.white.opacity(0.15)
                                : Color.black.opacity(0.75)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 4)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            if let index = devices.firstIndex(where: { $0.id == device.id }) {
                                devices.remove(at: index)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.redCustom)

                        Button {
                            selectedDevice = device.wrappedValue
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.blueCustom)
                    }
                }
            }
            .listStyle(.plain)
        }
        .sheet(item: $selectedDevice) { deviceToEdit in
            EditDeviceView(device: deviceToEdit) { updatedDevice in
                if let index = devices.firstIndex(where: { $0.id == updatedDevice.id }) {
                    devices[index] = updatedDevice
                }
                selectedDevice = nil
            }
        }
    }
}


//#Preview {
//    DeviceListView()
//}

