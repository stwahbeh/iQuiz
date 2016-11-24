//
//  iQuizTableViewCell.swift
//  iQuiz
//
//  Created by iGuest on 11/4/16.
//  Copyright © 2016 Hai Nguyen. All rights reserved.
//

import UIKit

class iQuizTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
