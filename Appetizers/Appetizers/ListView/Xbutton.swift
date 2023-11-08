//
//  Xbutton.swift
//  Appetizers
//
//  Created by Марина on 03.11.2023.
//

import SwiftUI

struct Xbutton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}

struct Xbutton_Previews: PreviewProvider {
    static var previews: some View {
        Xbutton()
    }
}
