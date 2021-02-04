//
//  ListOfResultsViewController.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-11-26.
//

import UIKit

class ListOfResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var results: [Result] = CoreDataManagement.readAllResults()
    var clickedResult: Result?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].date
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedResult = results[indexPath.row]
        performSegue(withIdentifier: "toDetailViewFromTable", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewFromTable" {
            if let destination = segue.destination as? ResultViewController {
                destination.result = clickedResult
            }
        }
    }
}
