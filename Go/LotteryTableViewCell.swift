//
//  LotteryTableViewCell.swift
//  Go
//
//  Created by Nilay Neeranjun on 3/29/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import UIKit

class LotteryTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var record: UILabel!
    @IBOutlet weak var probability: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
