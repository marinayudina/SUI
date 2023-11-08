//
//  Appetizer.swift
//  Appetizers
//
//  Created by Марина on 31.10.2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id : Int
    let description: String
    let name: String
    let price: Double
    let imageURL: String
    let protein: Int
    let carbs: Int
    let calories: Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct Mockdata {
    static let simpleAppetizer = Appetizer(id: 0001,
                                           description: "new product",
                                           name: "123",
                                           price: 99.9,
                                           imageURL: "asian-flank-steak",
                                           protein: 12,
                                           carbs: 0,
                                           calories: 150)
    
    
    
    static let simpleAppetizer1 = Appetizer(id: 0001,
                                           description: "new product",
                                           name: "123",
                                           price: 99.9,
                                           imageURL: "asian-flank-steak",
                                           protein: 12,
                                           carbs: 0,
                                           calories: 150)
    static let simpleAppetizer2 = Appetizer(id: 0002,
                                           description: "new product",
                                           name: "123",
                                           price: 99.9,
                                           imageURL: "asian-flank-steak",
                                           protein: 12,
                                           carbs: 0,
                                           calories: 150)
    static let simpleAppetizer3 = Appetizer(id: 0003,
                                           description: "new product",
                                           name: "123",
                                           price: 99.9,
                                           imageURL: "asian-flank-steak",
                                           protein: 12,
                                           carbs: 0,
                                           calories: 150)
    static let appetizers = [simpleAppetizer, simpleAppetizer, simpleAppetizer, simpleAppetizer]
    static let orderItems = [simpleAppetizer1, simpleAppetizer2, simpleAppetizer3]
}

