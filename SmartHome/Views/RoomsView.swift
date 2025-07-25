//
//  RoomView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct RoomsView: View {
       
    @Binding var devices: [SmartDevice]
    @State private var selectedDevice: SmartDevice?
    @State private var showActionSheet = false
    @State private var showEditSheet = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    ForEach(RoomType.allCases) { roomType in
                        let filteredDevices = $devices.filter { $0.roomType.wrappedValue == roomType }
                        
                        if !filteredDevices.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 8) {
                                    Image(systemName: roomType.iconName)
                                        .foregroundColor(.blueCustom)
                                    Text(roomType.rawValue)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                }
                                .padding(.horizontal)
                            
                                LazyVGrid(
                                    columns: [GridItem(.adaptive(minimum: 175), spacing: 16)],
                                    spacing: 16
                                ) {
                                    ForEach(filteredDevices) { device in
                                        RoomItemView(device: device)
                                            .simultaneousGesture( // so tht pickers can be oprated AND longPreassure is possible at the same time.
                                                LongPressGesture()
                                                    .onEnded { _ in
                                                        selectedDevice = device.wrappedValue
                                                        showActionSheet = true
                                                    }
                                            )
                                    }
                                }
                                .padding(.horizontal)
                                
                                Divider()
                                    .padding(.horizontal, 16)
                                    .frame(height: 0.25)
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Edit Device"),
                message: Text("What do you want to do with the device?"),
                buttons: [
                    .default(Text("Edit")) {
//                        print("Edit: \(selectedDevice?.name ?? "")")
                        showEditSheet = true
                    },
                    .destructive(Text("Delete")) {
                        if let id = selectedDevice?.id,
                           let index = devices.firstIndex(where: { $0.id == id }) {
                            devices.remove(at: index)
                        }
                        selectedDevice = nil
                    },
                    .cancel {
                        selectedDevice = nil
                    }
                ]
            )
        }
        .sheet(isPresented: $showEditSheet) {
            if let deviceToEdit = selectedDevice {
                EditDeviceView(device: deviceToEdit) { updatedDevice in
                    if let index = devices.firstIndex(where: { $0.id == updatedDevice.id }) {
                        devices[index] = updatedDevice
                    }
                    selectedDevice = nil
                    showEditSheet = false
                }
            }
        }
    }
}

//#Preview {
//    Roomsiew()
//}

// => Vorteil LazyGrid:
// => columns Parameter - Spaltendefinition
//
//    [GridItem(.adaptive(minimum: 175), spacing: 16)]
//
//    .adaptive(minimum: 175):
//
// => responsives Grid, das so viele Spalten wie möglich anzeigt
//
//        - Jede Spalte hat eine Mindestbreite von 175 Punkten
//
//        - Beispiel bei verschiedenen Bildschirmbreiten:
//
//            350pt Breite: 2 Spalten (2 × 175 = 350)
//
//            500pt Breite: 2 Spalten (2 × 175 = 350, Rest ist Freiraum)
//
//            700pt Breite: 4 Spalten (4 × 175 = 700)
//
// => spacing: 16:
//
//       - Horizontaler Abstand zwischen den Spalten (16 Punkte)
