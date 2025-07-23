//
//  RoomType.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import Foundation


enum RoomType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case bedroom = "Bedroom"
    case bathroom = "Bathroom"
    case hallway = "Hallway"
    case office = "Office"
    case garage = "Garage"
    case garden = "Garden"
    case basement = "Basement"
    case diningRoom = "Dining Room"
    case kidsRoom = "Kids Room"
    case guestRoom = "Guest Room"
    
    var iconName: String {
        switch self {
        case .livingRoom: return "sofa.fill"
        case .kitchen: return "fork.knife"
        case .bedroom: return "bed.double.fill"
        case .bathroom: return "shower.fill"
        case .hallway: return "rectangle.portrait"
        case .office: return "desktopcomputer"
        case .garage: return "car.fill"
        case .garden: return "leaf.fill"
        case .basement: return "cube.box.fill"
        case .diningRoom: return "table.furniture"
        case .kidsRoom: return "figure.child"
        case .guestRoom: return "person.fill.questionmark"
        }
    }
}
