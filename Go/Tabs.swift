//
//  Tabs.swift
//  Go
//
//  Created by Nilay Neeranjun on 4/1/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import UIKit

class Tabs: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       print ("hi")
    }
 


}
