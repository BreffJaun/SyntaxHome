//
//  RoomPickerView.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import SwiftUI

struct RoomPickerView: View {
    
    @Binding var selectedRoomType: RoomType
    
    var body: some View {
        HStack {
            Image(systemName: selectedRoomType.iconName)
                .foregroundColor(.blue)
                .font(.system(size: 20))
                .frame(width: 24)
            
            Picker("", selection: $selectedRoomType) {
                ForEach(RoomType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.menu)
            .padding(-4)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

//#Preview {
//    RoomPickerView()
//}
