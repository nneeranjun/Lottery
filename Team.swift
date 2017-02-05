//
//  Team.swift
//  Go
//
//  Created by Nilay Neeranjun on 3/25/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//
import ObjectMapper
import Foundation

class Team: Mappable{
    var firstName:String?;
    var lastName: String?;
    var seed: Int?;
    var won: Int?;
    var lost: Int?;
    var percentage: String?;
    var draftingPosition: Int?;
    var possibilities: [[Int]]?;
    var isLottery: Bool?;
    var gamesBeind: Float?;
    var streak: String?;
    var nickName: String="";
    var lastTen: String?;
    var probability: String?;
    
    
    
    required  init?(_ map: Map) {}
    
     func mapping(map: Map) {
         firstName <- map["first_name"]
        lastName <- map["last_name"]
        seed <- map["playoff_seed"]
        won <- map["won"]
        lost <- map["lost"]
        percentage <- map["win_percentage"]
        gamesBeind <- map["games_back"]
        streak <- map["streak"]
        lastTen <- map["last_ten"]
    }
   
    func setPossibilities(nPossibilities: [[Int]]){
        possibilities=nPossibilities;
    }
    func returnPossibilities()-> [[Int]]{
        return possibilities!;
    }
    
    func setDraftingPosition(position: Int){
        draftingPosition=position;
    }
    func getDraftingPosition()->Int{
        return draftingPosition!;
    }
    func setNickname() {
        switch lastName! {
            case "Cavaliers":
                nickName = "CLE"
                break;
            case "Raptors":
                nickName = "TOR"
                break
            case "Hornets":
                nickName = "CHA"
                break
            case "Hawks":
                nickName = "ATL"
                break
            case "Heat":
                nickName = "MIA"
                break
            case "Celtics":
                nickName = "BOS"
                break
            case "Pistons":
                nickName = "DET"
                break
            case "Pacers":
                nickName = "IND"
                break
            case "Bulls":
                nickName = "CHI"
                break
            case "Wizards":
                nickName = "WAS"
                break
            case "Bucks":
                nickName = "MIL"
                break
            case "Magic":
                nickName = "ORL"
                break
            case "Knicks":
                nickName = "NYK"
                break
            case "Nets":
                nickName = "BKN"
                break
            case "76ers":
                nickName = "PHI"
                break
            case "Warriors":
                nickName = "GSW"
                break
            case "Spurs":
                nickName = "SAS"
                break
            case "Thunder":
                nickName = "OKC"
                break
            case "Clippers":
                nickName = "LAC"
                break
            case "Grizzlies":
                nickName = "MEM"
                break
            case "Trail Blazers":
                nickName = "POR"
                break
            case "Mavericks":
                nickName = "DAL"
                break
            case "Jazz":
                nickName = "UTA"
                break
            case "Rockets":
                nickName = "HOU"
                break
            case "Nuggets":
                nickName = "DEN"
                break
            case "Kings":
                nickName = "SAC"
                break
            case "Pelicans":
                nickName = "NOP"
                break
            case "Timberwolves":
                nickName = "MIN"
                break
            case "Suns":
                nickName = "PHX"
                break
            case "Lakers":
                nickName = "LAL"
                break
        default:
            break
        }
    }
}