//
//  StandingsTableViewController.swift
//  Go
//
//  Created by Nilay Neeranjun on 4/3/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//
import ObjectMapper
import Alamofire
import UIKit

class StandingsTableViewController: UITableViewController {
    var currentStandings: [Team] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let headers = [
            "User-agent": "LotteryMachine/1.0 (nilayneeranjun24@gmail.com)",
        ]
        Alamofire.request(.GET, "https://erikberg.com/nba/standings.json",headers: headers)
            .responseJSON { response in
                let parentJson = Mapper<Standings>().map(response.2.value)
                self.currentStandings = parentJson!.standing!
                for i in 0...self.currentStandings.count-1{
                    self.currentStandings[i].setNickname()
                }
                self.tableView.reloadData()
                
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentStandings.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StandingsTableViewCell", forIndexPath: indexPath) as! StandingsTableViewCell
            let position = indexPath.row+1
            let teamName = currentStandings[indexPath.row].nickName
        let record = String(self.currentStandings[indexPath.row].won!) + "-" + String(self.currentStandings[indexPath.row].lost!)
        let logo =   UIImage(named:(currentStandings[indexPath.row].lastName?.lowercaseString)!)
        let percentage = currentStandings[indexPath.row].percentage!
        let gamesBehind = currentStandings[indexPath.row].gamesBeind!
        let lastTen = currentStandings[indexPath.row].lastTen!
        cell.position.text = String(position)
        cell.record.text = record
        cell.team.text = teamName
        cell.teamLogo.image = logo
        cell.percentage.text = String(percentage)
        cell.gamesBehind.text = String(gamesBehind)
        cell.lastTen.text = lastTen

        return cell
    }
    override func 
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
