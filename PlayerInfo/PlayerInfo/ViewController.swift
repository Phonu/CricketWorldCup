//
//  ViewController.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 15/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: Any) {
        UserDefaults.standard.set(userName.text, forKey: "username")
        UserDefaults.standard.set(password.text, forKey: "password")
        
        if userName.text == "User"{
            self.performSegue(withIdentifier: "User", sender: self)
        }else if userName.text == "Admin" {
            self.performSegue(withIdentifier: "Admin", sender: self)
        }else{
            let siginAlert = UIAlertController.init(title:"Error", message: "Invalid User name", preferredStyle: .alert)
            siginAlert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
            self.present(siginAlert, animated: true, completion: nil)
        }
    }
}

