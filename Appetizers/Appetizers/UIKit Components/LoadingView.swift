//
//  LoadingView.swift
//  Appetizers
//
//  Created by Марина on 02.11.2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
