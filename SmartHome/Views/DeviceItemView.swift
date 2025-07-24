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
        HStack {
            deviceIcon

            VStack(alignment: .leading, spacing: 4) {
                Text(device.name)
                    .font(.headline)

                HStack {
                    Text("Room: ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(device.roomType.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            deviceSpecificContent
        }
        .padding()
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 75)
        .foregroundStyle(.primary)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(
            color: colorScheme == .light ? .black.opacity(0.05) : .black.opacity(0.3),
            radius: 8, x: 0, y: 4
        )
    }
   


    // MARK: Icon Name
    private var iconName: String {
        switch device.deviceType {
        case .light:
            return device.isOn ? "lightbulb.fill" : "lightbulb"
        case .thermal:
            if device.temp < 17 {
                return "thermometer.low"
            } else if device.temp < 25 {
                return "thermometer.medium"
            } else {
                return "thermometer.high"
            }
        case .lock:
            return device.isLocked ? "lock.fill" : "lock.open.fill"
        }
    }

    // MARK: Icon Color
    private var iconColor: Color {
        switch device.deviceType {
        case .light:
            return device.isOn ? .yellow : .blue
        case .thermal:
            switch device.temp {
            case ..<14:
                return .blue
            case 14..<17:
                return Color.cyan
            case 17..<20:
                return Color.green
            case 20..<23:
                return Color.yellow
            case 23..<26:
                return Color.orange
            default:
                return Color.red
            }

        case .lock:
            return device.isLocked ? .red : .green
        }
    }
    
    // MARK: Device Icon with symbolEffect
    @ViewBuilder
    private var deviceIcon: some View {
        let icon = Image(systemName: iconName)
            .padding(.trailing, 10)
            .foregroundColor(iconColor)
            .font(.system(size: 20))
            .frame(width: 24)

        switch device.deviceType {
        case .light:
            icon.symbolEffect(.bounce, value: device.isOn)
        case .lock:
            icon.symbolEffect(.bounce, value: device.isLocked)
        case .thermal:
            icon.symbolEffect(.pulse, value: device.temp)
        }
    }

    // MARK: Device Content
    @ViewBuilder
    private var deviceSpecificContent: some View {
        switch device.deviceType {
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
                    .tint(iconColor)
            }
            .frame(width: 150)

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
}

