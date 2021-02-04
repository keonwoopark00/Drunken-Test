//
//  Result.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-12-02.
//

import Foundation

class Result {
    var percentage: Float
    var message: String
    var date: String
    
    init(percentage: Float, dateString: String = "") {
        self.percentage = percentage
        message = MessageCreator.getMessage(percentage: percentage)
        if dateString == "" {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy HH:mm"
            date = formatter.string(from: currentDate)
        }
        else {
            date = dateString
        }
    }
}
