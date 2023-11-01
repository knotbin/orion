//
//  CreateAccountViewViewModel.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/8/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateAccountViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func createAccount() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userid = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userid)
        }
    }
    
    func insertUserRecord(id: String) {
        let newuser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newuser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill out all fields."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        guard password.count >= 8 else {
            errorMessage = "Password must be more than 8 characters"
            return false
        }
        
        return true
    }
}
