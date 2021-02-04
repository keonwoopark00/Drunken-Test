//
//  LevelOneViewController.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-11-26.
//

import UIKit

class LevelOneViewController: UIViewController {
    // create an instance of wordBrain to access word-questions
    var wordBrain: WordBrain = WordBrain()
    var drunkenPercentage: Float = 0.0
    var result: Result?
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var wordTxt: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide back button
        navItem.hidesBackButton = true
        wordLbl.text = wordBrain.getWord()
        progressView.progress = 1 / 7
    }
    

    @IBAction func enterBtn(_ sender: UIButton) {
        if let userInput = wordTxt.text {
            if wordBrain.isRightAnswer(word: wordLbl.text!, answer: userInput) {
                drunkenPercentage += 5.0
                progressView.progress += 1 / 7
                if wordBrain.isLastWord() { // if a user completes 7 questions
                    // go to next level
                    performSegue(withIdentifier: "toLevelTwo", sender: nil)
                } else {
                    // get next word
                    wordLbl.text = wordBrain.getWord()
                    wordTxt.text = ""
                }
            } else { // if the user enters a wrong answer -> save result and display result screen
                CoreDataManagement.saveResult(drunkenPercentage: drunkenPercentage)
                result = Result(percentage: drunkenPercentage)
                performSegue(withIdentifier: "toDetailViewFromOne", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewFromOne" {
            if let destination = segue.destination as? ResultViewController {
                destination.result = result
            }
        }
    }
}
