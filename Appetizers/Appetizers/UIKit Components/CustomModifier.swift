//
//  CustomModifier.swift
//  Appetizers
//
//  Created by Марина on 06.11.2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

struct StandardImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 130, height: 90)
            .cornerRadius(8)
    }
}

//extension Image {
//
//    func StandardImageStyle() -> some View {
//        self
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 130, height: 90)
//            .cornerRadius(8)
//    }
//}
