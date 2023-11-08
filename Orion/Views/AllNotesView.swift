//
//  AllNotesView.swift
//  Orion
//
//  Created by Beau Rubin-Rottenberg on 11/7/23.
//

import SwiftUI

struct AllNotesView: View {
    @State var crocs = "";
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    AllNotesView()
}
