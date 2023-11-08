//
//  AccourntView.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 9/6/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    VStack(alignment: .center) {
                        Text(user.name)
                            .bold()
                            .font(.system(size: 22))
                            .padding()
                        HStack {
                            Text("Email")
                                .bold()
                            Text (user.email)
                        }
                        HStack {
                            Text("Member since")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                        }
                        Button() {
                            viewModel.signOut()
                        } label: {
                            Text("Sign Out")
                                .bold()
                        }
                        .tint(Color.red)
                        .padding()
                    }
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Account")
        }
        .onAppear {
                viewModel.fetchUser()
            }
    }
    
}

struct AccourntView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
