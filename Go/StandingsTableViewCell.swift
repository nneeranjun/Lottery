//
//  StandingsTableViewCell.swift
//  Go
//
//  Created by Nilay Neeranjun on 4/3/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var record: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var gamesBehind: UILabel!
    @IBOutlet weak var lastTen: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
