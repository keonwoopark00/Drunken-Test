//
//  WordBrain.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-12-02.
//

import Foundation

class WordBrain {
    private var wordBanks: [Word] = [
        Word(word: "Walk"),
        Word(word: "Swimming"),
        Word(word: "Cry"),
        Word(word: "Germany"),
        Word(word: "United"),
        Word(word: "Karma"),
        Word(word: "Aatrox"),
        Word(word: "Description"),
        Word(word: "Match"),
        Word(word: "Toronto"),
        Word(word: "Montreal"),
        Word(word: "Alcohol"),
        Word(word: "Grand"),
        Word(word: "Initialize"),
        Word(word: "Declare")
    ]
    
    private var count: Int = 0
    
    func getWord()->String {
        count += 1
        return wordBanks.randomElement()!.word
    }
    
    func isLastWord()->Bool {
        if count == 7 {
            return true
        }
        return false
    }
    
    func isRightAnswer(word: String, answer: String)->Bool {
        if word == answer {
            return true
        } else {
            return false
        }
    }
}
