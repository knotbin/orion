//
//  LoginViewViewModel.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func signIn() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
                if let error = error {
                    self?.errorMessage = "Sign-in failed, check email and password."
                    return
                }
        }
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill out all fields."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        return true
    }
}
