//
//  CoreDataManagement.swift
//  drunkenTest
//
//  Created by Keonwoo Park on 2020-12-02.
//

import UIKit
import CoreData

// class to deal with CoreData
class CoreDataManagement {
    
    static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelegate.persistentContainer.viewContext
    
    static func saveResult(drunkenPercentage: Float) {
        let newResult = NSEntityDescription.insertNewObject(forEntityName: "Results", into: context)
        let result = Result(percentage: drunkenPercentage)
        newResult.setValue(result.percentage, forKey: "result")
        newResult.setValue(result.message, forKey: "message")
        newResult.setValue(result.date, forKey: "date")
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
    
    static func readAllResults()->[Result] {
        var listOfResults: [Result] = []
        let dataRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Results")
        do {
            let fetchResults = try context.fetch(dataRequest)
            if fetchResults.count > 0 {
                var p: Float?
                var d: String?
                for fetchResult in fetchResults as! [NSManagedObject] {
                    if let percentage = fetchResult.value(forKey: "result") as? Float {
                        p = percentage
                    }
                    if let date = fetchResult.value(forKey: "date") as? String {
                        d = date
                    }
                    listOfResults.append(Result(percentage: p ?? 0.0, dateString: d ?? "No Date"))
                }
            }
        } catch {
            print("error")
        }
        return listOfResults
    }
}
