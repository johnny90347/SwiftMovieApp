//
//  Rating.swift
//  MovieApp
//
//  Created by johnny on 2021/3/11.
//

import SwiftUI

struct Rating: View {
    
    // @Binding 雙向綁定
    @Binding var rating:Int?
    
    private func starType(index:Int)->String{
        // if let 解包
        if let rating = self.rating{
            return index < rating ? "star.fill":"star"
        }else{
            return "star"
        }
    }
    
    var body: some View {
        HStack{
            ForEach(1...10,id:\.self){ index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index;
                    }
            }
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: .constant(3))
    }
}
