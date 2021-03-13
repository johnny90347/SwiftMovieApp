//
//  URL+Extensions.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import Foundation

extension URL{
    
    static func forMoviesByName(_ name:String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByImdbId(_ imdbId:String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
}
