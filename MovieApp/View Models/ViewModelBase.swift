//
//  ViewModelBase.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState:LoadingState = .none;
}
