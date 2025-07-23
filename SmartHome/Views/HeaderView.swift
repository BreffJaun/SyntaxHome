//
//  HeaderView.swift
//  SmartHome
//
//  Created by Jeff Braun on 22.07.25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var devices: [SmartDevice]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Syntax Home")
                .font(.title)
                .bold()
                .padding(.horizontal, 8)

            AddDeviceView(devices: $devices)
                .padding(.vertical)
        }
        .padding(8)
        .frame(height: 200)
        .frame(maxWidth: .infinity, alignment: .topLeading)
//        .border(.green)
        
        Divider()
            .frame(height: 0.5)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
    }
}


//#Preview {
//    HeaderView()
//}
