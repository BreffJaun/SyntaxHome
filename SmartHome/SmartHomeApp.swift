import SwiftUI

@main
struct SmartHomeApp: App {
    
    // MARK: IMPORTANT => This behavior causes the bottom tab bar to always be visible, showing its translucency over every view - regardless of how “full” the view is and no matter if any content goes behind the tab bar. Hell yeahhh 🥳
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.shadowColor = UIColor.gray.withAlphaComponent(0.3)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            SmartHomeView()
        }
    }
}
