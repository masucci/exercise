//
//  UserServiceMock.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class UserServiceMock: UserServiceProtocol {
    private var mockUsers = [User]()
    
    init(mockUsers: [User]) {
        self.mockUsers = mockUsers
    }

    func getUsers() async -> [User] {
        mockUsers
    }
}
