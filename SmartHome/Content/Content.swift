//
//  Content.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import Foundation

var smartDevices: [SmartDevice] = [
    SmartDevice(name: "Living Room Light", deviceType: .light, roomType: .livingRoom, isOn: true),
    SmartDevice(name: "Heater", deviceType: .thermal, roomType: .bathroom, temp: 22.5),
    SmartDevice(name: "Front Door", deviceType: .lock, roomType: .diningRoom, isLocked: true),
    SmartDevice(name: "Bath light", deviceType: .light, roomType: .bathroom, isOn: false)
]
