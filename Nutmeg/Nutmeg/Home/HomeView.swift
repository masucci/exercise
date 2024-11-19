//
//  ContentView.swift
//  Nutmeg
//
//  Created by Lorenzo Masucci on 02/10/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.cellInfo) { post in
                NavigationLink (
                    destination: PostDetailsView(postId: post.id)
                ){
                    VStack(alignment: .leading) {
                        Text("\(post.username)")
                            .font(.headline)
                        Text(post.title)
                            .font(.subheadline)
                            .accessibilityIdentifier("ui.cell.postId.\(post.id)")
                    }
                }
            }
            .navigationTitle("Posts")
            .task {
                await viewModel.getCellInfoCollection()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let apiService = APIService()
    static let userService = UserServiceImpl(apiService: apiService)
    static let postService = PostServiceImpl(apiService: apiService)
    static let homeViewModel = HomeViewModel(userService: userService, postService: postService)
    static var previews: some View {
        HomeView(viewModel: homeViewModel)
    }
}
