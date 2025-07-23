//
//  RoomView.swift
//  SmartHome
//
//  Created by Jeff Braun on 21.07.25.
//

import SwiftUI

struct RoomView: View {
    
    @Binding var showRoomPreview: Bool
    
    var body: some View {
        if showRoomPreview {
            VStack(alignment: .center) {
                Rectangle()
    //                .fill(Color.orange)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 1.0, green: 0.65, blue: 0.0),
                                Color(red: 0.8, green: 0.4, blue: 0.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 300, height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.white, lineWidth: 30)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    )
                    .padding()
            }
        }
    }
}

//#Preview {
//    RoomView()
//}
