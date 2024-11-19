//
//  Post.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
}
