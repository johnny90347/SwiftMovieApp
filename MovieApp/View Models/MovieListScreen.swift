//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import SwiftUI

struct MovieListScreen: View {
    // 但是如果今天是比較複雜的型別(透過class來定義), 且與多個畫面有連動時, 這時候會建議使用@ObservedObject這個屬性裝飾器來實現
    // 而且這個class 必須要遵從ObservableObject這個協議(protocol)
    // 除子之外在此class之間,還要告訴SwiftUI 哪些參數是我們所關心的
    // 加上 @published
    // ObservedObject 有更新後,會重新渲染畫面
    // 在iOS14中才推出了@StateObject 來取代了 ObservedObject,會有的問題
    
    @ObservedObject private var movieListVM:MovieListViewModel
    // struct內,的屬性原本都是不可變的,但加上State,SwiftUI就會認為這個
    // 屬性與畫面是相關的,當屬性改變時就會更新畫面
    // 在Swift中使用$字號表示這種雙向綁定的屬性
    @State private var movieName:String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
//        self.movieListVM.searchByName("batman")
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName) { (bool) in
                //
            } onCommit: {
                self.movieListVM.searchByName(self.movieName)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            .navigationTitle("Movies")
            
            if self.movieListVM.loadingState == .success{
                MovieListView(movies:movieListVM.movies)
            }else if self.movieListVM.loadingState == .failed{
                FailedView()
            }
        }
        .padding()
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
