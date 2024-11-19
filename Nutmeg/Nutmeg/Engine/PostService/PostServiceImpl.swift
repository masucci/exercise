//
//  PostServiceImpl.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class PostServiceImpl: PostServiceProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getPosts() async -> [Post] {
        let postsURL = "https://jsonplaceholder.typicode.com/posts"
        do {
            return try await apiService.fetchDataAsync(url: postsURL, responseType: [Post].self)
        } catch {
            return []
        }
    }
}
