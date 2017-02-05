//
//  ViewController.swift
//  Go
//
//  Created by Nilay Neeranjun on 3/24/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import UIKit
import Alamofire
import Foundation;
import ObjectMapper
class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let headers = ["User-agent": "AlamoFire/1.0 (nilayneeranjun24@gmail.com)"]
         var temp: [Team]?;
        let lottery = LotteryMachine()
        var standingsArray: [Team]?;
        Alamofire.request(.GET, "https://erikberg.com/nba/standings.json", headers: headers).responseJSON{response in
            let parentJson = Mapper<Standings>().map(response.2.value)
            
            standingsArray = parentJson!.standing!
        }
        
        
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}