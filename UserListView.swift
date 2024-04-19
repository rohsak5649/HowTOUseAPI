//
//  ContentView.swift
//  ApiUse
//
//  Created by Rohan Sakhare on 19/04/24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.email) { user in
                VStack(alignment: .leading) {
                    Text("\(user.name.first) \(user.name.last)") // Display full name
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Users")
        }
        .onAppear {
            self.viewModel.fetchUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}

