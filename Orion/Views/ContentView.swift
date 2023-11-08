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
            AllNotesView()
                .tabItem {
                    Label("Notes", systemImage: "paperplane.circle.fill")
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
