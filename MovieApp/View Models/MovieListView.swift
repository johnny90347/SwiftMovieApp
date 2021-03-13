//
//  MovieListView.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import SwiftUI

struct MovieListView: View {
    
    // let 的 就是建立此view時要初始化的屬性
    let movies:[MovieViewModel]
    
    var body: some View {
        List(self.movies,id:\.imdbId){ movie in
            MovieCell(movie: movie)// 使整個HStack 可以點選,不然空白處選不到
        }
    }
}


//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}

struct MovieCell: View {
    
    let movie:MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
