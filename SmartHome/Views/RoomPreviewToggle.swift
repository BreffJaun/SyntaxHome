//
//  RoomPrevieeToggle.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct RoomPreviewToggle: View {
    @Binding var showRoomPreview: Bool
    
    var body: some View {
        VStack {
            Toggle("Room View", isOn: $showRoomPreview)
        }
        .padding()
        .tint(.blue)
//        .border(.red)
    }
}

//#Preview {
//    RoomPreviewToggle()
//}
