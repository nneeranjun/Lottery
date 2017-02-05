//
//  Standings.swift
//  Go
//
//  Created by Nilay Neeranjun on 3/25/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//
import ObjectMapper
import Foundation
class Standings: Mappable {
    var standing: [Team]?

 func mapping(map: Map) {
    standing <- map["standing"]
}
    required init?(_ map: Map) {

}
    
    func returnLotteryTeams(){
      
    }
}
