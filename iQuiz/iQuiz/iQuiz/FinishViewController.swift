//
//  FinishViewController.swift
//  iQuiz
//
//  Created by sam wahbeh on 11/20/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    @IBOutlet weak var descriptiveLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var question = [""]
    var answers = [""]
    var options = [["", ""], ["", ""]]
    var pointer = 0
    
    
    var answer = ""
    var correct = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let percentage = Double(correct) / Double(question.count)
        scoreLabel.text = "\(correct) / \(question.count)"
        
        if (percentage == 1){
            descriptiveLabel.text = "Perfect!!!"
        } else if (percentage >= 0.75 ){
            descriptiveLabel.text = "Wow Almost"
        } else if (percentage >= 0.50) {
            descriptiveLabel.text = "Keep Trying"
        } else {
            descriptiveLabel.text = "You alright?"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearData(_ sender: Any) {
         question = [""]
         answers = [""]
         options = [["", ""], ["", ""]]
         pointer = 0
        
        
         answer = ""
         correct = 0
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
