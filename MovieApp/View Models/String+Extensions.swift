//
//  String+Extensions.swift
//  MovieApp
//
//  Created by 梁鑫文 on 2021/3/13.
//

import Foundation

extension String{
    func termmedAndEscaped() -> String {
        // trimmingCharacters  trim 修剪的意思,字串前後不要的文字修剪掉,移除空白與換行符號
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines);
        // 編碼 ex: / -> % ,網址用的
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self;
    }
}
