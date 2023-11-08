//
//  APIError.swift
//  Appetizers
//
//  Created by Марина on 01.11.2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse //404 or sth from server
    case invalidData
    case unableToComplete //ex: wifi error
}
