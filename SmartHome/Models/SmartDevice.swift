//
//  Device.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import Foundation

struct SmartDevice: Identifiable {
    let id: UUID = UUID()
    var name: String = ""
    var type: DeviceType
    var isOn: Bool = false
    var temp: Double = 20.0
    var isLocked: Bool = true
}
