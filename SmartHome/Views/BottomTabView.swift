//
//  BottomTabView.swift
//  SmartHome
//
//  Created by Jeff Braun on 23.07.25.
//

import SwiftUI

struct BottomTabView: View {
    
    @Binding var showRoomPreview: Bool
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: 0.5)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: -2)
            RoomPreviewToggle(showRoomPreview: $showRoomPreview)
        }
//        .border(.blue)
    }
}

//#Preview {
//    BottomTabView()
//}


