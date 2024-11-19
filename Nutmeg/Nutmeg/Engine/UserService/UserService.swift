//
//  UserService.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

protocol UserServiceProtocol {
    func getUsers() async -> [User]
}
