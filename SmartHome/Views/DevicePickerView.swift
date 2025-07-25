//
//  DevicePickerView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct DevicePickerView: View {
    @Binding var selectedDeviceType: DeviceType

    var body: some View {
        HStack{
            Image(systemName: selectedDeviceType.iconName)
                .foregroundColor(.tealCustom)
                .font(.system(size: 20))
                .frame(width: 24)

            Picker("", selection: $selectedDeviceType) {
                ForEach(DeviceType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.menu)
            .padding(-4)
            .tint(Color.tealCustom)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}


//#Preview {
//    DevicePickerView()
//}
