




import SwiftUI

struct SmartHomeView: View {
    
    @State var devices = smartDevices

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(devices: $devices)
            BottomTabView(devices: $devices)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGray6))
    }
}

#Preview {
    SmartHomeView()
}

