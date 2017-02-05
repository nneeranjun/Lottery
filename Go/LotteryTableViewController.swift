//
//  LotteryTableViewController.swift
//  Go
//
//  Created by Nilay Neeranjun on 3/30/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class LotteryTableViewController: UITableViewController {
    let lotteryMachine = LotteryMachine()
    var temp:[Team]=[]
    var currentStandings: [Team] = []
    var otherView: UIView = UIView()
    
    var images = [UIImage]()
    var imageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let headers = [
            "User-agent": "LotteryMachine/1.0 (nilayneeranjun24@gmail.com)",
                   ]
            Alamofire.request(.GET, "https://erikberg.com/nba/standings.json",headers: headers)
                .responseJSON { response in
                    let parentJson = Mapper<Standings>().map(response.2.value)
                   let standingsArray: [Team] = parentJson!.standing!
                        self.currentStandings=standingsArray
                    var playoff: [Team]=[]
                    var nonPlayoff: [Team]=[]
                    for i in 0...7 {
                        playoff.append(standingsArray[i])
                    }
                    for i in 8...14 {
                        nonPlayoff.append(standingsArray[i])
                    }
                    for i in 15...22 {
                        playoff.append(standingsArray[i])
                    }
                    for i in 23...29 {
                        nonPlayoff.append(standingsArray[i])
                    }
                    playoff.sortInPlace({$0.percentage<$1.percentage})
                                       nonPlayoff.sortInPlace({$0.percentage<$1.percentage})
                    for i in 0...nonPlayoff.count-1 {
                        self.images.append(UIImage(named: (nonPlayoff[i].lastName?.lowercaseString)!)!)
                    }

                                       for i in 0...playoff.count-1 {
                        nonPlayoff.append(playoff[i])
                    }

                    self.currentStandings=nonPlayoff;
                    self.temp=self.currentStandings
                    for i in 0...self.temp.count-1{
                        self.temp[i].setNickname()
                        self.currentStandings[i].setNickname()
                        
                    }
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onAdd:")
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "reset:")
                    

                    self.tableView.reloadData()
                    }
                
        }




        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return temp.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "LotteryTableViewCell"
        

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! LotteryTableViewCell
        
        let teamName = self.temp[indexPath.row].nickName
       let record = String(self.temp[indexPath.row].won!) + "-" + String(self.temp[indexPath.row].lost!)
        
        let player = "Stephen Zimmerman"
        cell.position.text = String(indexPath.row+1)
        cell.teamName.text = teamName
        cell.record.text = String(record)
        cell.player.text = player
        cell.teamLogo.image = UIImage(named: (temp[indexPath.row].lastName?.lowercaseString)!)
       
        
        

        // Configure the cell...

        return cell
    }
    func onAdd(sender: AnyObject) {
        var lastIndex = NSIndexPath(forRow:  0, inSection: 0)
        self.tableView.scrollToRowAtIndexPath(lastIndex, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
    self.temp=self.lotteryMachine.setPossibleCombinations(currentStandings)
        self.temp=self.lotteryMachine.setDraftPositions(self.temp)
        otherView = UIView()
        otherView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        otherView.frame = self.view.frame
        self.tableView.scrollEnabled = false;
        images = images.shuffle()
        
        self.imageView          = UIImageView(frame: CGRectMake(0, 0, 85, 80))
        self.otherView.center = self.view.center
        self.imageView?.center  = CGPointMake(self.view.bounds.size.width/2, view.bounds.size.height/2-100)
        self.otherView.addSubview(self.imageView!)
               self.view.addSubview(otherView)
        self.navigationItem.rightBarButtonItem!.enabled = false
        self.navigationItem.leftBarButtonItem!.enabled = false
        self.showImageAtIndex(0)
    }
    func reset(sender: AnyObject){
        self.temp=self.currentStandings
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! HeaderLotteryCell
        return headerCell
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 19
    }
    func showImageAtIndex(index: Int) {
        
        // all UI updates happen on the main queue
        dispatch_async(dispatch_get_main_queue()) {
            if (index) >  self.images.count-1 { self.otherView.removeFromSuperview()
                self.imageView?.removeFromSuperview()
                                 self.navigationItem.rightBarButtonItem!.enabled = true
                self.navigationItem.leftBarButtonItem!.enabled = true
                self.tableView.reloadData()
                self.automaticallyAdjustsScrollViewInsets = true;
                self.tableView.scrollEnabled = true;
                return
            }

            
            self.imageView?.image = self.images[index]
            
            
            let delayTime = 0.096
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delayTime * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
                
                self.showImageAtIndex(index + 1)
                
            }
            
        }
       
        
    }
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
extension CollectionType {
    func shuffle() -> Array<Generator.Element> {
        var indexArray = Array(indices)
        
        let indexGenerator: AnyGenerator<Index> = anyGenerator {
            if indexArray.count == 0 { return nil }
            let count = UInt32(indexArray.count)
            let index = Int(arc4random_uniform(count))
            return indexArray.removeAtIndex(index)
        }
        return Array(PermutationGenerator(elements: self, indices: AnySequence(indexGenerator)))
    }
}
