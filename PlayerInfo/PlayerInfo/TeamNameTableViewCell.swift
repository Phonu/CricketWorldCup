//
//  TeamNameTableViewCell.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 16/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class TeamNameTableViewCell: UITableViewCell {
    @IBOutlet weak var teamFlag: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
