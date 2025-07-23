//
//  AddDeviceView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct AddDeviceView: View {
    @Binding var inputText: String
    @Binding var showText: String
    @Binding var selectedType: DeviceType
    @Binding var devices: [SmartDevice]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
           HStack(spacing: 12) {
               TextField("Device name", text: $inputText)
                   .padding(10)
                   .overlay(
                       RoundedRectangle(cornerRadius: 12)
                           .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                   )
               DevicePickerView(inputText: $inputText, selectedType: $selectedType)
           }

           Button(action: {
               // MARK: 2.4
               let name = inputText
               devices.append(SmartDevice(name: name, type: selectedType))
//               showText = "\(inputText) (\(selectedType.rawValue))"
               inputText = ""
           }) {
               HStack {
                   Image(systemName: "plus")
                   Text("Add Device")
                       .fontWeight(.semibold)
               }
               .frame(maxWidth: .infinity)
               .padding(.horizontal, 24)
               .padding(.vertical, 12)
               .background(Color.blue)
               .foregroundStyle(.white)
               .clipShape(RoundedRectangle(cornerRadius: 12))
           }
           
       }
        .padding(.horizontal, 8)
        
    }
}

//#Preview {
//    AddDeviceView()
//}
