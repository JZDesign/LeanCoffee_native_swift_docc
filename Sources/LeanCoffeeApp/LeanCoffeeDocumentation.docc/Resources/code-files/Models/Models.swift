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

struct AccessToken: Codable {
    let value: String
}

struct CastVote: Codable {
    let topicId: String
}

struct CreateLeanCoffee: Codable {
    let title: String
}

struct CreateTopic: Codable {
    let title: String
    let description: String
    let leanCoffeeId: String
}

struct CreateUser: Codable {
    let name: String
    let username: String
    let password: String
}
