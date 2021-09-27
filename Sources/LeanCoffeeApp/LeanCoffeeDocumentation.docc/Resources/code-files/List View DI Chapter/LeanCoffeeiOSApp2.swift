import SwiftUI

@main
struct LeanCoffeeiOSApp: App {
    @StateObject var tokenStore = TokenStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tokenStore)
        }
    }
}
