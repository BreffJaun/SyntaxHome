//
//  BottomTabView.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import SwiftUI

//struct BottomTabView: View {
//    
//    @Binding var showRoomPreview: Bool
//    
//    var body: some View {
//        VStack {
//            Divider()
//                .frame(height: 0.5)
//                .background(Color.white)
//                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: -2)
//            RoomPreviewToggle(showRoomPreview: $showRoomPreview)
//        }
//    }
//}

//struct BottomTabView: View {
//    
//    @Binding var devices: [SmartDevice]
//    
//    var body: some View {
//        VStack(spacing: 0) {
////            Divider()
////                .frame(height: 0.5)
////                .background(Color.white)
////                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: -2)
//            TabView {
//                DeviceListView(devices: $devices)
//                    .tabItem {
//                        Label("Home", systemImage: "house.fill")
//                    }
//
//                RoomsView(devices: $devices)
//                    .tabItem {
//                        Label("Räume", systemImage: "square.grid.2x2")
//                    }
//
//                TypesView(devices: $devices)
//                    .tabItem {
//                        Label("Typen", systemImage: "lightbulb")
//                }
//            }
//            .frame(maxHeight: .infinity)
//        }
//        .border(.red)
//    }
//}

struct BottomTabView: View {
    
    @Binding var devices: [SmartDevice]
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                DeviceListView(devices: $devices)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .border(.red)

                RoomsView(devices: $devices)
                    .tabItem {
                        Label("Räume", systemImage: "square.grid.2x2")
                    }
                    .border(.blue)

                TypesView(devices: $devices)
                    .tabItem {
                        Label("Typen", systemImage: "lightbulb")
                    }
                    .border(.green)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}



//#Preview {
//    BottomTabView()
//}


