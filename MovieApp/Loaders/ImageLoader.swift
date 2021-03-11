//
//  ImageLoader.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/10.
//

import Foundation

// download image
class ImageLoader: ObservableObject {
    
    // published 修飾的屬性,當這個 Property 被更新時，會發送 (emit) 一個事件通知給監控它的物件。
    @Published var downloadedDate:Data?
    
    func downloadImage(url:String){
        
        // guard 也是像 if else 的判斷
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, uRLResponse, error) in
            
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedDate = data
            }
            
        }.resume()
    }
    
}
