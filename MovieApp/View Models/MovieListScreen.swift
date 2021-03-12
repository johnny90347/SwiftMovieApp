//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import SwiftUI

struct MovieListScreen: View {
    
    // ObservedObject 有更新後,會重新渲染畫面
    @ObservedObject private var movieListVM:MovieListViewModel
    
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName("batman")
    }
    
    var body: some View {
        VStack {
            MovieListView(movies:movieListVM.movies)
                .navigationTitle("Movies")
        }.embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
