//
//  DetailView.swift
//  Frameworks_new
//
//  Created by Марина on 30.10.2023.
//

import SwiftUI

struct DetailView: View {
    var framework: Framework
    @State private var isShowingSafariView = false
    
    var body: some View {
       
        VStack {
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper")!)
        }
      
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}
