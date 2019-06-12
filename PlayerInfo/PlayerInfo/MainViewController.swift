//
//  MainViewController.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 15/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userNameTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameTitle.text = UserDefaults.standard.string(forKey: "username")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
