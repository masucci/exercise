//
//  PostDetailsView.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import SwiftUI

struct PostDetailsView: View {
    @ObservedObject var viewModel: PostDetailsViewModel
    private let postId: Int
    
    init(viewModel: PostDetailsViewModel = PostDetailsViewModel(commentsService: CommentsServiceImpl(apiService: APIService())),
         postId: Int) {
        self.viewModel = viewModel
        self.postId = postId
    }
    
    var body: some View {
        List(viewModel.comments) { comment in
            Text(comment.name)
                .accessibilityIdentifier("ui.text.commentsName.\(comment.id)")
        }
        .task {
            await viewModel.getComments(postId: postId)
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(viewModel: PostDetailsViewModel(commentsService: CommentsServiceImpl(apiService: APIService())), postId: 1)
    }
}
