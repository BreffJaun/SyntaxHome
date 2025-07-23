




import SwiftUI

struct SmartHomeView: View {
    
    @State var devices = smartDevices
    @State var showRoomPreview: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(devices: $devices)
            if showRoomPreview {
                RoomView(devices: $devices)
            } else {
                DeviceListView(devices: $devices)
            }
            BottomTabView(showRoomPreview: $showRoomPreview)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGray6))
    }
}

#Preview {
    SmartHomeView()
}
