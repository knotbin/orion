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
            //tabs of itemslistview, locationslistview, and accountview
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
