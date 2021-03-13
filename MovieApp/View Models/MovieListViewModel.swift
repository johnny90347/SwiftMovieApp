//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import Foundation


// 為了要讓搜尋不到電影可以導入另外一頁,他又創了一個ViewModelBase來繼承,由於裡面本來就繼承,ObservableObject
// 這邊的 ObservableObject 就刪掉了,
class MovieListViewModel:ViewModelBase {
    
   @Published var movies = [MovieViewModel]() // 改變時發送通知給訂閱者
    
    let httpClient = HTTPClient()
    
    func searchByName(_ name:String) {
        
        if name.isEmpty {
            return
        }
        
        httpClient.getMoviesBy(search: name.termmedAndEscaped()){ result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    // 通过传入init方法(假设存在该类型的init())将一件东西的集合转换为另一件东西的能力。
                    DispatchQueue.main.async {
                        print("轉換前\(movies)")
                        self.movies = movies.map(MovieViewModel.init)
                        print("轉換後\(self.movies)")
                        // 繼承的
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                break
            }
        }
    }
}


struct MovieViewModel {
    
    let movie:Movie
    
    var imdbId:String {
        movie.imdbId
    }
    
    var title:String {
        movie.title
    }
    
    var poster:String {
        movie.poster
    }
    
    var year:String {
        movie.year
    }
}
