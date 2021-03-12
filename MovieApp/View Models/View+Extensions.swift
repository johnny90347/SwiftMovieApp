//
//  View+Extensions.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/12.
//

import Foundation
import SwiftUI


extension View {
    
    // 這只是把 東西包在 NavifationView 裡面而已,我自己覺得沒必要
    func embedNavigationView()-> some View {
        return NavigationView{self}
    }
}
