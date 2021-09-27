import SwiftUI

struct LeanCoffee: Codable, Identifiable {
    let id: String
    let title: String
    let date: String
}

struct Topic: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let completed: Bool
    let votes: [Vote]
}

struct Vote: Codable, Identifiable {
    let id: String
}
