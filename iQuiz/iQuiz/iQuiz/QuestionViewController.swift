//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by sam wahbeh on 11/20/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var question = [""]
    var answers = [""]
    var options = [["", ""], ["", ""]]
    var pointer = 0
    
    
    var answer = ""
    var correct = 0
    
    
    @IBOutlet weak var questionLable: UILabel!

    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a4: UIButton!
   
    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var pointerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        // Do any additional setup after loading the view.
        
        var buttons = [a1, a2, a3, a4]
        for index in 0 ... 3 {
            buttons[index]?.setTitle(options[0][index], for: UIControlState.normal)
        }
        
        questionLable.text = question[pointer]
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
    answer = sender.currentTitle!
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != "toHome"){
        
        let controller = segue.destination as! AnswerViewController
        controller.question = question
        controller.options = options
        controller.answers = answers
        controller.pointer = pointer
        
        controller.answer = answer
        
        if (answer == answers[pointer]){
            controller.correct = correct + 1
        } else {
            controller.correct = correct
        }
        }
        
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
