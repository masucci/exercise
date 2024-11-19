//
//  APIService.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetchDataAsync<T: Decodable>(url: String, responseType: T.Type) async throws -> T
}

enum APIError: Error {
    case invalidURL
}

final class APIService: APIServiceProtocol {
    
    func fetchDataAsync<T: Decodable>(url: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
