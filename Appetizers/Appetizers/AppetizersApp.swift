//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Марина on 31.10.2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
            //childs of TabView have access to array of orders
        }
    }
}
