//
//  OrionApp.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct OrionApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
