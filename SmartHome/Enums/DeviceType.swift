//
//  DeviceType.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

enum DeviceType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case light = "Light"
    case thermal = "Thermal"
    case lock = "Lock"
    
    var iconName: String {
        switch self {
        case .light: return "lightbulb.fill"
        case .thermal: return "thermometer"
        case .lock: return "lock.fill"
        }
    }
}


