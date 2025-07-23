//
//  RoomItemView.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import SwiftUI

struct RoomItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var device: SmartDevice

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: iconName)
                .padding(.vertical, 8)
                .font(.system(size: 28))
                .foregroundColor(iconColor)

            Text(device.name)
                .padding(.bottom, 8)
                .font(.headline)
                .multilineTextAlignment(.center)

            deviceSpecificContent
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 175, maxHeight: 175)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(
            color: colorScheme == .light ? .black.opacity(0.05) : .black.opacity(0.3),
            radius: 6, x: 0, y: 4
        )
    }

    // MARK: - Icon Name
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

    // MARK: - Icon Color
    private var iconColor: Color {
        switch device.deviceType {
        case .light:
            return device.isOn ? .yellow : .gray
        case .thermal:
            if device.temp < 17 {
                return .blue
            } else if device.temp < 25 {
                return .green
            } else {
                return .red
            }
        case .lock:
            return device.isLocked ? .red : .green
        }
    }

    // MARK: - Device Content
    @ViewBuilder
    private var deviceSpecificContent: some View {
        switch device.deviceType {
        case .light:
            Toggle("", isOn: $device.isOn)
                .labelsHidden()
                .scaleEffect(0.8)

        case .thermal:
            HStack(spacing: 2) {
                Text("\(Int(device.temp))°")
                    .padding(.trailing, 8)
                    .font(.subheadline)
                Slider(value: $device.temp, in: 10...30, step: 1)
                    .tint(iconColor)
                    .frame(height: 10)
            }

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

//#Preview {
//    RoomItemView()
//}
