//
//  AddButton.swift
//  Appetizers
//
//  Created by Марина on 03.11.2023.
//

import SwiftUI

struct AddButton: View {
    let title: String
    let appetizerPrice: Double
    
    var body: some View {
            Text("$\(appetizerPrice, specifier: "%.2f") - \(title)")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 260, height: 50)
                .foregroundColor(.white)
                .background(Color.brandPrimary)
                .cornerRadius(10)
        }
    
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(title: "Add to order", appetizerPrice: Mockdata.simpleAppetizer.price)
    }
}
