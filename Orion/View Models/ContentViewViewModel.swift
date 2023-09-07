//
//  ContentViewViewModel.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import Foundation
import FirebaseAuth

class ContentViewViewModel: ObservableObject {
    @Published var currentUserID = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
            self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
