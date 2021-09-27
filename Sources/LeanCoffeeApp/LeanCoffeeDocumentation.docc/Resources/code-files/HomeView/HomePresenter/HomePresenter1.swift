import SwiftUI

class HomePresenter: Presenter {
    let accessToken: AccessToken

    init(_ accessToken: AccessToken) {
        self.accessToken = accessToken
    }
}
