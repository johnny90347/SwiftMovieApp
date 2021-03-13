//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import Foundation

class MovieDetailViewModel:ObservableObject{
    
    private var movieDetail:MovieDetail?
    @Published var loadingState = LoadingState.loading;
    
    private var httpClient = HTTPClient()
    
    init(movieDetail:MovieDetail? = nil){
        self.movieDetail = movieDetail
    }
    
    func getDetailByImdbId(imdbId:String){
        httpClient.getMovieDetailsBy(imdbId: imdbId) { (result) in
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self.movieDetail  = detail
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var title:String {
        self.movieDetail?.title ?? ""
    }
    
    var poster:String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot:String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating:Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
            //ceil(x)返回不小于x的最小整数值（然后转换为double型）
        }
    }
    
    var director:String {
        self.movieDetail?.director ?? ""
    }
}
