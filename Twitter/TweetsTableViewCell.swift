//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by Elijah Bullard on 2/21/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tweetContentText: UILabel!
    @IBOutlet weak var createdTime: UILabel!
    @IBOutlet weak var userHandle: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
