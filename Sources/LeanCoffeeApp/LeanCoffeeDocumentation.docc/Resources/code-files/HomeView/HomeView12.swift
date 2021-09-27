import SwiftUI

struct HomeView: View {

    @ObservedObject var presenter = HomePresenter()

    var addLeanCoffeeButton: some View {
        NavigationLink(destination: {
            CreateLeanCoffeeView()
        }) {
            Image(systemName: "plus")
        }
    }

    var body: some View {
        NavigationView {
            List(presenter.events) { leanCoffee in
                NavigationLink(destination: {
                    LeanCoffeeView(presenter: LeanCoffeePresenter(leanCoffee))
                }) {
                    Text(leanCoffee.title)
                }
            }
            .navigationBarItems(trailing: addLeanCoffeeButton)
            .navigationTitle(Text("Lean Coffee"))
        }
        .task {
            await presenter.refreshEvents()
        }
        .refreshable {
            await presenter.refreshEvents()
        }
    }
}
