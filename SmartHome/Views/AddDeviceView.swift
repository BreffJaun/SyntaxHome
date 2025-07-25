//
//  AddDeviceView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct AddDeviceView: View {
    
    
    @Binding var devices: [SmartDevice]
    @State var inputText: String = ""
    @State var selectedDeviceType: DeviceType = .light
    @State var selectedRoomType : RoomType = .office
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                TextField("Device name", text: $inputText)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                DevicePickerView(selectedDeviceType: $selectedDeviceType)
            }

            HStack(spacing: 12) {
                Button(action: {
                    let name = inputText
                    devices.append(SmartDevice(name: name, deviceType: selectedDeviceType, roomType: selectedRoomType))
                    inputText = ""
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Device")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
//                    .padding(10)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(Color.tealCustom)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                RoomPickerView(selectedRoomType: $selectedRoomType)
            }
        }
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    AddDeviceView()
//}
