//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Марина on 03.11.2023.
//

import SwiftUI

final class AccountViewModel : ObservableObject {
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    ///UserDefaults - Data - User
    @AppStorage("user") private var userData: Data?
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.emailAdress.isEmpty else {
            alertItem = AlertContext.invalidForm
            
            return false
            
        }
        
        guard user.emailAdress.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch {
            alertItem = AlertContext.invalidUserData
        }
        
        print("Changes have been saved succesfully")
    }
    
    
    func extractUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
