//
//  PostServiceMock.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class PostServiceMock: PostServiceProtocol {
    private var mockPosts = [Post]()
    
    init(mockPosts: [Post]) {
        self.mockPosts = mockPosts
    }

    func getPosts() async -> [Post] {
        mockPosts
    }
}
