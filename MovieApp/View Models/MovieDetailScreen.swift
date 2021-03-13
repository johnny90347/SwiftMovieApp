//
//  MovieDetailScreen.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId:String
    
    @StateObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            if movieDetailVM.loadingState == .success {
                
            }else if movieDetailVM.loadingState == .failed{
                FailedView()
            }
        }
    }
}

//struct MovieDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailScreen(imdbId: )
//    }
//}
