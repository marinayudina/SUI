//
//  XButton.swift
//  Frameworks_new
//
//  Created by Марина on 30.10.2023.
//

import SwiftUI

struct XButton: View {
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton(isShowingDetailView: .constant(false))
    }
}
