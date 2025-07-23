//
//  DevicePickerView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct DevicePickerView: View {
    @Binding var inputText: String
    @Binding var selectedType: DeviceType

    var body: some View {
        HStack/*(spacing: 12)*/ {
            Image(systemName: iconName(for: selectedType))
                .foregroundColor(.blue)
                .font(.system(size: 20))
                .frame(width: 24)

            Picker("", selection: $selectedType) {
                ForEach(DeviceType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.menu)
            .padding(-4)// => shows Dropdown with arrows up & down
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }

    func iconName(for type: DeviceType) -> String {
        switch type {
        case .light:
            return "lightbulb"
        case .thermal:
            return "thermometer"
        case .lock:
            return "lock"
        }
    }
}


//#Preview {
//    DevicePickerView()
//}
