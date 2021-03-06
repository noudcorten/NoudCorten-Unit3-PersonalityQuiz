//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Noud on 14-11-18.
//  Copyright © 2018 Noud. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: properties
    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    // MARK: when the view is loaded it updates the UI to the corresponding animal
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: checks every answered question and 'calculates' what the user's corresponding animal is
    func calculatePersonalityResults() {
        var frequencyOfAnswer: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswer.sorted{ $0.1  > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
