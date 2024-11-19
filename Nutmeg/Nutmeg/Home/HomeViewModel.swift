//
//  HomeViewModel.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var cellInfo: [CellInfo] = []
    private var posts: [Post] = []
    private var users: [Int : User] = [:]
    private let userService: UserServiceProtocol
    private let postService: PostServiceProtocol
    
    init(userService: UserServiceProtocol,
         postService: PostServiceProtocol) {
        self.userService = userService
        self.postService = postService
    }
    
    func getCellInfoCollection() async {
        await loadPosts()
        await loadUsers()
        await MainActor.run {
            self.cellInfo = self.posts.map { post in
                CellInfo(id: post.id,
                         title: post.title,
                         username: self.users[post.userId]?.username ?? "Unknown User")
            }
        }
    }
    
    func loadUsers() async {
        let fetchedUsers = await userService.getUsers()
        for user in fetchedUsers {
            users[user.id] = user
        }
    }
    
    func loadPosts() async {
        posts = await postService.getPosts()
    }
}
