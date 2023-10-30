//
//  FrameworkViewModel.swift
//  Frameworks_new
//
//  Created by Марина on 30.10.2023.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
    ///when  marked @Published is changed, all views using that object will be reloaded to reflect those changes.
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
}
