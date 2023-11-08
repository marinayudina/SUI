//
//  EmptyState.swift
//  Appetizers
//
//  Created by Марина on 04.11.2023.
//

import SwiftUI

struct EmptyState: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image("empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text("You have no items in order.\n Please make your choice")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
