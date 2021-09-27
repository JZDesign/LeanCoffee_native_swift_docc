import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    init(_ accessToken: AccessToken) {
        self.presenter = HomePresenter(accessToken)
    }

    var body: some View {
        NavigationView {
            List(presenter.events) { leanCoffee in
                NavigationLink(destination: {
                    Text("You navigated to lean coffee: \(leanCoffee.id)")
                }) {
                    Text(leanCoffee.title)
                }
            }.navigationTitle(Text("Lean Coffee"))
        }
        .toAsyncView(presenter)
        .task {
            await presenter.refreshEvents()
        }
        .refreshable {
            await presenter.refreshEvents()
        }
    }
}
