//
//  Comment.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

struct Comment: Decodable, Identifiable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
