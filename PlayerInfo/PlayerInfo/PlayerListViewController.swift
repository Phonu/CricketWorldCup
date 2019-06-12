//
//  PlayerListViewController.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 19/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class PlayerListViewController: UIViewController {
    

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var playerListTableView: UITableView!
    var playerListArray = [String]()
    var teamNameClicked : String = ""
    var selectedPlayer : String = ""
    @IBOutlet weak var editOrDoneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerListTableView.delegate = self
        playerListTableView.dataSource = self
        teamName.text = self.teamNameClicked
    }
    
    @IBAction func editOrDoneAction(_ sender: Any) {
        
        if playerListTableView.isEditing {
            self.editOrDoneButton.setTitle("Edit", for: .normal)
        }else{

            self.editOrDoneButton.setTitle("Done", for: .normal)
        }
        playerListTableView.isEditing = !playerListTableView.isEditing

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eachPlayerInfo"{
            if let destinationVC = segue.destination as? EachPlayerInfoViewController{
                destinationVC.playerNameString = self.selectedPlayer
            }
        }
    }
}

extension PlayerListViewController :UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "playersName"
        let cell : PlayerListTableViewCell! = playerListTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PlayerListTableViewCell
        cell.playerName.text = String(indexPath.row + 1) + ". " + playerListArray[indexPath.row]
        cell.playerPics.image = UIImage(named:playerListArray[indexPath.row])
        if indexPath.row>10{
            cell.playerView.backgroundColor = .red
        }
        else{
            cell.playerView.backgroundColor = .green
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = self.playerListArray[sourceIndexPath.row]
        self.playerListArray.remove(at: sourceIndexPath.row)
        self.playerListArray.insert(item, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlayer = playerListArray[indexPath.row]
        self.performSegue(withIdentifier: "eachPlayerInfo", sender: self)
        
    }
    
    

}
