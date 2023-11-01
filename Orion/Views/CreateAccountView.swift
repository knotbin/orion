//
//  CreateAccountView.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/8/23.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject var viewModel = CreateAccountViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            Text("Create an account")
                .fontWeight(.heavy)
                .font(.system(size: 50))
                .multilineTextAlignment(.center)
                .padding(.top, 100.0)
            
            Form {
                if (!viewModel.errorMessage.isEmpty) {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                TLButton(title: "Sign Up",
                         bgColor: .green) {
                    viewModel.createAccount()
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)

            
            Spacer()
        }
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
