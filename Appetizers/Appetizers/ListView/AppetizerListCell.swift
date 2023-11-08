//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Марина on 01.11.2023.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlSTring: appetizer.imageURL)
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 130, height: 90)
//            .cornerRadius(10)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
//                    .resizable()
//                    .modifier(StandardImageStyle())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 90)
                            .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(StandardImageStyle())
            }


            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)

                Text(String(format: "$%.2f", appetizer.price))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: Mockdata.simpleAppetizer)
    }
}
