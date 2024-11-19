//
//  CommentsServiceMock.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class CommentServiceMock: CommentsServiceProtocol {
    private var mockComments = [Comment]()
    
    init(mockComments: [Comment]) {
        self.mockComments = mockComments
    }

    func getComments(postId: Int) async -> [Comment] {
        mockComments
    }
}
