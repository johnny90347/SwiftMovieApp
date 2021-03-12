//
//  Movie.swift
//  MovieApp
//
//  Created by johnny on 2021/3/12.
//

import Foundation

struct MoiveResponse: Codable {
    let movies:[Movie]
    
    private enum CodingKeys:String,CodingKey{
        case movies = "Search" // 文件格式是 { Search:[...] } , 替換成movies
    }
}

struct Movie: Codable {
    let title:String
    let year:String
    let imdbId:String
    let poster:String
    
    // 影片中為了要讓model中的屬性都是小寫開頭,所以使用了替換的key
    private enum CodingKeys:String,CodingKey{
        case title = "Title" // Title是取回的屬性名稱
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
