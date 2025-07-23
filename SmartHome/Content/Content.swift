//
//  Content.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import Foundation

var smartDevices: [SmartDevice] = [
    SmartDevice(name: "Living Room Light", type: .light, isOn: true),
    SmartDevice(name: "Heater", type: .thermal, temp: 22.5),
    SmartDevice(name: "Front Door", type: .lock, isLocked: true)
]
