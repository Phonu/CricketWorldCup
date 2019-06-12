//
//  TeamListViewController.swift
//  PlayerInfo
//
//  Created by Kunal Poddar on 16/05/19.
//  Copyright © 2019 Kunal Poddar. All rights reserved.
//

import UIKit

class TeamListViewController: UIViewController {
    

    var teamListName = [String]()
    @IBOutlet weak var teamListTableView: UITableView!
    var selectedTeamName:String = ""
    var indianPlayer = [String]()
    var englandPlayer = [String]()
    
    var teamAndPlayerLists:[String:Any] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        teamListName = ["INDIA", "AUSTRALIA", "ENGLAND", "SOUTH AFRICA", "SRI LANKA"]
        self.fetchingLocalJSONData()
        

        
        teamListTableView.delegate = self
        teamListTableView.dataSource = self
        
        indianPlayer = ["Rohit", "Shikhar", "Virat", "Dhoni"]
        englandPlayer = ["Jason Roy", "BairStrow", "Joe Root", "Josh Butler"]
        
//        teamAndPlayerLists = [["India": ["Rohit", "Shikhar", "Virat", "Dhoni"],"Australia" : ["",""]]]
        
        
        
        
        teamListTableView.reloadData()
    }
    
    
    func fetchingLocalJSONData(){
        let mainBundle = Bundle.main
        let fileName: String = "WorldCupPlayerList"
        if let jsonPath = mainBundle.path(forResource: fileName, ofType: ".json", inDirectory: nil, forLocalization: nil)
        {
            do {
            
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
           
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    print(json)
                    
                    if let teamPlayerDict = json as? [String:Any]{
                        print("kunal\(teamPlayerDict)")
                        teamAndPlayerLists = teamPlayerDict
                        teamListName = Array(teamAndPlayerLists.keys)
                    }
                    
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamInfo"{
            if let destinationVC = segue.destination as? PlayerListViewController{
                destinationVC.teamNameClicked = self.selectedTeamName
                destinationVC.playerListArray = self.teamAndPlayerLists[self.selectedTeamName] as! [String]
            }
        }
    }
}






extension TeamListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamListName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "teamName"
        let cell : TeamNameTableViewCell! = teamListTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TeamNameTableViewCell
        cell.teamName.text = teamListName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTeamName = self.teamListName[indexPath.row]
        self.performSegue(withIdentifier: "teamInfo", sender: self)
    }
    

}
