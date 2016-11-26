//
//  iQuizTableViewController.swift
//  iQuiz
//
//  Created by sam wahbeh on 11/13/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class iQuizTableViewController: UITableViewController {

    @IBOutlet weak var settings: UIBarButtonItem!
    
    let subject = ["Math", "Marvel", "Science"]
    let descript = ["Math is Fun", "WOW MARVEL", "Sciencey stuff"]
    let imageIcons = [#imageLiteral(resourceName: "science"), #imageLiteral(resourceName: "math"), #imageLiteral(resourceName: "marvel")]
    
    
    var question = ["2 + 2 =" , "1 + 1 ="]
    var answers = ["4", "2"]
    var options = [["1", "2", "3", "4"], ["1", "2", "3", "4"]]
    var pointer = 0
    var correct = 0
    



    //questions, options, answers

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")!; _ = NSData(contentsOf: url)
        
        let requestURL: NSURL = NSURL(string: "https://tednewardsandbox.site44.com/questions.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            let path = Bundle.main.path(forResource: "data", ofType: "txt")!
            
            if (statusCode == 200) {
                print("download complete")
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) //reads from url
                    NSData(data: data!).write(toFile: path, atomically: true)
                }
                catch {
                    print("Error with file: \(error)")
                }
            } else {
                var content = NSData(data: data!).write(toFile: path, atomically: true) //reads from local
            }
        }
        
        task.resume()
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! QuestionViewController
        controller.question = question
        controller.options = options
        controller.answers = answers
        controller.pointer = pointer
        controller.correct = correct
    }
 */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        // #warning Incomplete implementation, return the number of rows
        
        
        return subject.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "iQuizCell", for: indexPath) as! iQuizTableViewCell

        // Configure the cell...
        cell.subjectLabel.text = subject[indexPath.row]
        cell.descriptionLabel.text = descript[indexPath.row]
        cell.imageLabel.image = imageIcons[indexPath.row]
        return cell
    }
    
    @IBAction func openSettings(_ sender: AnyObject) {
        let settingsAlert = UIAlertController(title: "Settings go here", message: "", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        settingsAlert.addAction(defaultAction)
        
        present(settingsAlert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func prepare(_ sender: Any) {
    
    
    }
    
    
//test changes
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
