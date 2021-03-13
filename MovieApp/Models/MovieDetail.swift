//
//  MovieDetail.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import Foundation

struct MovieDetail:Decodable{
   
    let title:String
    let year:String
    let plot:String
    let director:String
    let actors:String
    let imdbRating:String
    let poster:String
    let imdbId:String
    
    private enum CodingKeys:String,CodingKey{
        case title="Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}
