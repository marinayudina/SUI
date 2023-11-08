//
//  RemoteObject.swift
//  Appetizers
//
//  Created by Марина on 02.11.2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.dowmloadImage(fromURLString: urlString) { UIimage in
            guard let uiimage = UIimage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader() //listen for changes
    let urlSTring: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlSTring)
            }
    }
}
