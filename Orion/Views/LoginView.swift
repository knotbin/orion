//
//  LoginView.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        VStack {
            Text("Sign in")
                .fontWeight(.heavy)
                .font(.system(size: 50))
                .padding(.top, 100.0)
                
            Form {
                if (!viewModel.errorMessage.isEmpty) {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                        .multilineTextAlignment(.leading)
                        .listRowSeparator(.hidden)
                }
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .listRowSeparator(.hidden)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .listRowSeparator(.hidden)
                TLButton(title: "Sign In", bgColor: Color.blue) {
                    viewModel.signIn()
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
