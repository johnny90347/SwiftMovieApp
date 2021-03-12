//
//  HTTPClient.swift
//  MovieApp
//
//  Created by johnny on 2021/3/12.
//

import Foundation

enum NetworkError:Error {
    case badUrl
    case noData
    case decodingError
}

class HTTPClient{
    
    // completion handel 是一個call back,請求完成後要做的事情, Result 是 swift 5 的語法,要提供成功或失敗的類型
    func getMoviesBy(search:String,completion:@escaping (Result<[Movie]?,NetworkError>)-> Void) {
        
        guard let url = URL.forMoviesByName(search) else{
            // 錯誤 .failure
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            guard let data = data,error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MoiveResponse.self, from: data)else{
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
            
        }.resume()
        
    }
}
