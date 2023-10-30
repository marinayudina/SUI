//
//  FrameworkTitleView.swift
//  Frameworks_new
//
//  Created by Марина on 30.10.2023.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework : Framework
            var body: some View {
                VStack {
                    Image(framework.imageName)
                        .resizable()
                        .frame(width: 90, height: 90)
                    Text(framework.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.label))
                        .scaledToFit()
                        .minimumScaleFactor(0.5)//minimum 50% of original size
                    
                }
                .padding()
            }

}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
