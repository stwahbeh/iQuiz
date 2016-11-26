//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by sam wahbeh on 11/20/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    @IBOutlet weak var pointerLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!

    
    var question = [""]
    var answers = [""]
    var options = [["", ""], ["", ""]]
    var pointer = 0
    
    
    var answer = ""
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        questionLabel.text = question[pointer]
        answerLabel.text = answers[pointer]
        yourAnswerLabel.text = answer

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toQuestion"){
        let controller = segue.destination as! QuestionViewController
            controller.question = question
            controller.options = options
            controller.answers = answers
            controller.pointer = pointer
            controller.correct = correct
        } else if (segue.identifier == "toResult"){
            let controller = segue.destination as! FinishViewController
            controller.question = question
            controller.options = options
            controller.answers = answers
            controller.pointer = pointer
            controller.correct = correct
            
        } else {
            
        }

        
    }
    
    @IBAction func switchView(_ sender: UIButton) {
        if (pointer < question.count - 1){
            pointer = pointer + 1
            performSegue(withIdentifier: "toQuestion", sender: self)
        } else {
            performSegue(withIdentifier: "toResult", sender: self)
        }
    }
 
    @IBAction func goHome(_ sender: UIButton) {
        performSegue(withIdentifier: "toHome", sender: self)
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
