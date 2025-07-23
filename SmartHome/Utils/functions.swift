//
//  functions.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import Foundation

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
