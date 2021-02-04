//
//  ResultViewController.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-11-26.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    var result: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = "\(result.percentage)% Drunken!"
        dateLbl.text = result.date
        messageLbl.text = result.message
    }
}
