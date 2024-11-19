//
//  NutmegTests.swift
//  NutmegTests
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import XCTest
@testable import Nutmeg

final class NutmegTests: XCTestCase {

    func test_getCellInfoCollection() async {
        // GIVEN
        let mockUsers = [User(id: 1, username: "User 1"),
                         User(id: 2, username: "User 2")]
        let mockPosts = [Post(userId: 1, id: 1, title: "Post 1"),
                         Post(userId: 2, id: 2, title: "Post 2")]
        let mockUserService = UserServiceMock(mockUsers: mockUsers)
        let mockPostService = PostServiceMock(mockPosts: mockPosts)
        let sut = HomeViewModel(userService: mockUserService, postService: mockPostService)
        
        // WHEN
        await sut.getCellInfoCollection()
        
        // THEN
        XCTAssertEqual(sut.cellInfo.count, 2)
        XCTAssertEqual(sut.cellInfo[0].title, "Post 1")
        XCTAssertEqual(sut.cellInfo[0].username, "User 1")
        XCTAssertEqual(sut.cellInfo[1].title, "Post 2")
        XCTAssertEqual(sut.cellInfo[1].username, "User 2")
    }
    
    func test_getComments() async {
        let mockComments = [Comment(postId: 1,
                                    id: 1,
                                    name: "I like your opinion",
                                    email: "lover@me.com",
                                    body: "Love"),
                            Comment(postId: 1,
                                    id: 2,
                                    name: "I hate your opinion",
                                    email: "hater@me.com",
                                    body: "Hate")]
        let mockCommentService = CommentServiceMock(mockComments: mockComments)
        let sut = PostDetailsViewModel(commentsService: mockCommentService)
        await sut.getComments(postId: 1)
        
        XCTAssertEqual(sut.comments.count, 2)
        XCTAssertEqual(sut.comments[0].postId, 1)
        XCTAssertEqual(sut.comments[0].name, "I like your opinion")
        XCTAssertEqual(sut.comments[1].postId, 1)
        XCTAssertEqual(sut.comments[1].name, "I hate your opinion")
    }
}
