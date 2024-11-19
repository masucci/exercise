//
//  NutmegApp.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import SwiftUI

@main
struct NutmegApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService = APIService()
            let userService = UserServiceImpl(apiService: apiService)
            let postService = PostServiceImpl(apiService: apiService)
            let homeViewModel = HomeViewModel(userService: userService, postService: postService)
            HomeView(viewModel: homeViewModel)
        }
    }
}
