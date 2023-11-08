//
//  ListViewModel.swift
//  Appetizers
//
//  Created by Марина on 01.11.2023.
//

import Foundation

@MainActor final class ListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = [] //broadcast changes
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView: Bool = false
    @Published var selectedAppetizer: Appetizer?
//
//    func getAppetizers() {
//        isLoading = true
//
//        NetworkManager.shared.getAppetizers {[self] result in
//            DispatchQueue.main.async {
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                       alertItem = AlertContext.invalidResponse
//
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidURL
//
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    
    
    func getAppetizers() {
        
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apierror = error as? APIError {
                    switch apierror {
                    case .invalidURL:
                        alertItem = AlertContext.invalidResponse
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse //some genric error
                }
    
                isLoading = false
            }
        }
   
    }
    
    
}
