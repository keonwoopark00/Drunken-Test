//
//  MessageCreator.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-12-02.
//

import Foundation

class MessageCreator {
    private static let messages: [String] = [
        "You are very drunken! Never drive a car and try to stay home and relax!",
        "You are quite drunken! Never drive a car and try to stay home and relax!",
        "You are becoming sober! However, avoid driving a car yet and drink some cold water!",
        "You are almost sober! You may go out and do your work except driving!",
        "Wow! You are completely sober!"
    ]
    
    static func getMessage(percentage: Float)->String {
        if percentage <= 30.0 {
            return messages[0]
        } else if percentage <= 65.0 {
            return messages[1]
        } else if percentage <= 85.0 {
            return messages[2]
        } else if percentage < 100.0 {
            return messages[3]
        } else {
            return messages[4]
        }
    }
}
