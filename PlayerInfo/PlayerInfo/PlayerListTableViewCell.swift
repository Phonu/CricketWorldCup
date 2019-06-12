//
//  PlayerListTableViewCell.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 19/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class PlayerListTableViewCell: UITableViewCell {
    @IBOutlet weak var playerPics: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playerView.layer.cornerRadius = playerView.frame.height/2
        playerPics.layer.cornerRadius = playerPics.frame.width/2
        playerPics.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
