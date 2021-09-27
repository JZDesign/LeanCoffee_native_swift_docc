import SwiftUI

struct HomeView: View {

    let events = [
        LeanCoffee(id: "1", title: "This is Test", date: "123"),
        LeanCoffee(id: "2", title: "This is Test", date: "123"),
        LeanCoffee(id: "3", title: "This is Test", date: "123")
    ]

    var body: some View {
        NavigationView {
            List(events) { leanCoffee in
                NavigationLink(destination: {
                    Text("You navigated to lean coffee: \(leanCoffee.id)")
                }) {
                    Text(leanCoffee.title)
                }
            }.navigationTitle(Text("Lean Coffee"))
        }
    }
}
