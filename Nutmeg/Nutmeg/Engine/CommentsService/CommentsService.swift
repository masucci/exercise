//
//  CommentsService.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

protocol CommentsServiceProtocol {
    func getComments(postId: Int) async -> [Comment]
}
