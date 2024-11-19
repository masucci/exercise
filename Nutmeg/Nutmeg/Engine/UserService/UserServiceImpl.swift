//
//  UserServiceImpl.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class UserServiceImpl: UserServiceProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getUsers() async -> [User] {
        let usersURL = "https://jsonplaceholder.typicode.com/users"
        do {
            return try await apiService.fetchDataAsync(url: usersURL, responseType: [User].self)
        } catch {
            return []
        }
    }
}
