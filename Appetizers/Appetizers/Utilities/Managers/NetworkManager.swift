//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Марина on 01.11.2023.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()///nsString = identifier key-value pair
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURl = baseURL + "appetizers"
    
    private init() {}
    
//    func getAppetizers(completion: @escaping (Result<[Appetizer], APIError>) -> Void) {
//        guard let url = URL(string: appetizerURl) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error {
//                completion(.failure(.unableToComplete))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,
//                      response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completion(.success(decodedResponse.request))
//            }
//            catch {
//                completion(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] { //throw error or return array
        
        guard let url = URL(string: appetizerURl) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
            
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        }
        catch {
            throw APIError.invalidData
        }
    }
    
    
    
    func dowmloadImage(fromURLString urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)//уникальная ссылка
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
            
        }
        task.resume()
    }
}
