//
//  EditDeviceView.swift
//  SyntaxHome
//
//  Created by Jeff Braun on 24.07.25.
//

import SwiftUI

struct EditDeviceView: View {
    
    let device: SmartDevice // original without binding
    var onSave: (SmartDevice) -> Void
    
    @Environment(\.dismiss) private var dismiss // makes it possible to close the sheet
    @State private var editedDevice: SmartDevice // editable copy
    
    init(device: SmartDevice, onSave: @escaping (SmartDevice) -> Void) { // @escaping for async behaviour 
        self.device = device
        self.onSave = onSave
        self._editedDevice = State(initialValue: device) // ← filled with the original non binding device
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $editedDevice.name)
                
                Picker("Type", selection: $editedDevice.deviceType) {
                    ForEach(DeviceType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                Picker("Room", selection: $editedDevice.roomType) {
                    ForEach(RoomType.allCases, id: \.self) { room in
                        Text(room.rawValue).tag(room)
                    }
                }
            }
            .navigationTitle("Edit device")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(editedDevice)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    EditDeviceView()
//}
