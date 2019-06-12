//
//  EachPlayerInfoViewController.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 22/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class EachPlayerInfoViewController: UIViewController {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    var playerNameString : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        playerImage.image = UIImage(named: self.playerNameString)
        playerName.text = self.playerNameString
    }
    

    

}
