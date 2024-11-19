//
//  PostDetailsViewModel.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class PostDetailsViewModel: ObservableObject {
    private let commentsService: CommentsServiceProtocol
    @Published var comments: [Comment] = []
    
    init(commentsService: CommentsServiceProtocol) {
        self.commentsService = commentsService
    }

    func getComments(postId: Int) async {
        let comments = await commentsService.getComments(postId: postId)
        await MainActor.run {
            self.comments = comments
        }
    }
}
