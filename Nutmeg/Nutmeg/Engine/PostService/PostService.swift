//
//  PostService.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

protocol PostServiceProtocol {
    func getPosts() async -> [Post]
}
