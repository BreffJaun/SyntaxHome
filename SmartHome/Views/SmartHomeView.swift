import SwiftUI

struct SmartHomeView: View {
    
//    @Environment(\.colorScheme) var colorScheme
//    
//    var backgroundColor: Color {
//            colorScheme == .dark
//                ? Color(red: 0.12, green: 0.12, blue: 0.15) // Helleres Dunkelgrau
//                : Color(red: 0.95, green: 0.95, blue: 0.97) // Etwas dunkler als weiß
//        }

    @State var devices = smartDevices
    @State var inputText: String = ""
    @State var showText: String = ""
    @State var showRoomPreview: Bool = false
    @State var selectedType: DeviceType = .light

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(inputText: $inputText, showText: $showText, selectedType: $selectedType, devices: $devices)
        
            DeviceListView(devices: $devices)
//                .background(Color("BackgroundColor"))
                    
            BottomTabView(showRoomPreview: $showRoomPreview)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGray6))
    }
}

#Preview {
    SmartHomeView()
}
