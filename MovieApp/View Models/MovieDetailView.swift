//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM:MovieDetailViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment:HorizontalAlignment.leading, spacing: 10){
                URLImage(url: movieDetailVM.poster).cornerRadius(10)
                Text(movieDetailVM.title).font(.title)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack{
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top,10)
                Spacer()
            }.padding()
            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
