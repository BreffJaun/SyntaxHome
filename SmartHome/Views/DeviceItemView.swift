//
//  DeviceItemView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct DeviceItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var device: SmartDevice
    
    var body: some View {
        HStack() {
            Image(systemName: device.type == .light ? "lightbulb" : device.type == .thermal ? "thermometer" : "lock")
                .foregroundColor(.blue)
                .font(.system(size: 20))
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4)  {
                Text(device.name)
                    .font(.headline)
                Text(device.type.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            switch device.type {
            case .light:
                Toggle("", isOn: $device.isOn)
                    .labelsHidden()

            case .thermal:
                HStack {
                    Text("\(Int(device.temp))°C")
                        .frame(width: 40, alignment: .leading)
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    Slider(value: $device.temp, in: 10...30, step: 1)
                        .tint(device.temp < 17 ? .blue : device.temp < 25 ? .green : .red)
                }
                .frame(width: 200)

            case .lock:
                Button(action: {
                    device.isLocked.toggle()
                }) {
                    Text(device.isLocked ? "Locked" : "Unlocked")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(device.isLocked ? Color.red : Color.green)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 75)
        .foregroundStyle(.primary)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(
            color: colorScheme == .light ? .black.opacity(0.05) : .black.opacity(0.3),
            radius: 8, x: 0, y: 4
        )
    }
}

//#Preview {
//    DeviceItemView()
//}

//func iconName(for type: DeviceType) -> String {
//    switch type {
//    case .light:
//        return "lightbulb"
//    case .thermal:
//        return "thermometer"
//    case .lock:
//        return "lock"
//    }
//}
