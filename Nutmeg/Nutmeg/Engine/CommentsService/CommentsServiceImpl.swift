//
//  CommentsServiceImpl.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class CommentsServiceImpl: CommentsServiceProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getComments(postId: Int) async -> [Comment] {
        // WE CAN USE A URL COMPOSER
        let commentsURL = "https://jsonplaceholder.typicode.com/posts/\(postId)/comments"
        do {
            return try await apiService.fetchDataAsync(url: commentsURL, responseType: [Comment].self)
        } catch {
            return []
        }
    }
}
