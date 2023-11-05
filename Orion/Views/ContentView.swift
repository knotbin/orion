//
//  ContentView.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserID.isEmpty {
            userView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var userView: some View {
        TabView {
            ItemsListView()
                .tabItem {
                    Label("Items", systemImage: "briefcase.circle.fill")
                }
            LocationsListView()
                .tabItem {
                    Label("Account", systemImage: "house.circle.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
