//
//  iQuizTableViewCell.swift
//  iQuiz
//
//  Created by sam wahbeh on 11/13/16.
//  Copyright © 2016 sam wahbeh. All rights reserved.
//

import UIKit

class iQuizTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
