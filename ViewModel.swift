//
//  ViewModel.swift
//  ApiUse
//
//  Created by Rohan Sakhare on 19/04/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetchUsers() {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let usersResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    self.users = usersResponse.results
                }
            } catch let decodingError {
                print("Decoding error: \(decodingError)")
            }
        }.resume()
    }
}

struct UserResponse: Codable {
    let results: [User]
}
