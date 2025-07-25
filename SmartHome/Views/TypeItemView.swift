//
//  TypeItemView.swift
//  SyntaxHome
//
//  Created by Jeff Braun on 25.07.25.
//

import SwiftUI

struct TypeItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var device: SmartDevice

    var body: some View {
        VStack(spacing: 8) {
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
            return device.isOn ? .yellowCustom : .blueCustom
        case .thermal:
            switch device.temp {
            case ..<14:
                return .blueCustom
            case 14..<17:
                return Color.tealLight
            case 17..<20:
                return Color.tealCustom
            case 20..<23:
                return Color.yellowCustom
            case 23..<26:
                return Color.orange
            default:
                return Color.redCustom
            }

        case .lock:
            return device.isLocked ? .redCustom : .tealCustom
        }
    }

    // MARK: - Device Content
    @ViewBuilder
    private var deviceSpecificContent: some View {
        switch device.deviceType {
        case .light:
            VStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.system(size: 28))
                    .foregroundColor(iconColor)
                    .symbolEffect(.bounce, value: device.isOn)

                Toggle("", isOn: $device.isOn)
                    .labelsHidden()
                    .scaleEffect(0.8)
                
                Text(device.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("Room: \(device.roomType.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

        case .thermal:
            VStack(spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Gauge(value: device.temp, in: 10...30) {
                        EmptyView()
                    } currentValueLabel: {
                        Text("\(Int(device.temp))°")
                    }
                    .gaugeStyle(.accessoryCircular)
                    .tint(
                        Gradient(colors: [.blueCustom, .tealCustom, .redCustom])
                    )
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)

                    Image(systemName: iconName)
                        .padding(.bottom, 4)
                        .font(.system(size: 28))
                        .foregroundColor(iconColor)
                        .symbolEffect(.pulse, options: .speed(0.5), value: device.temp)
                        .frame(maxWidth: .infinity)
                    
                }

                Slider(value: $device.temp, in: 10...30, step: 1)
                    .frame(maxWidth: .infinity)
                    .tint(iconColor)
                
                Text(device.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("Room: \(device.roomType.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

        case .lock:
            VStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.system(size: 28))
                    .foregroundColor(iconColor)
                    .symbolEffect(.bounce, value: device.isLocked)

                Button(action: {
                    device.isLocked.toggle()
                }) {
                    Text(device.isLocked ? "Locked" : "Unlocked")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(device.isLocked ? .redCustom : .tealCustom)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Text(device.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("Room: \(device.roomType.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//#Preview {
//    TypeItemView()
//}
