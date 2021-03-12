 //
//  ContentView.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                // life cycle
                .onAppear{
                    HTTPClient().getMoviesBy(search: "batman"){result in
                        print(result)
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
