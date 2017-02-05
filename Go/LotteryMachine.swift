//
//  LotteryMachine.swift
//  Nba Lottery
//
//  Created by Nilay Neeranjun on 3/24/16.
//  Copyright © 2016 Nilay Neeranjun. All rights reserved.
//

import Foundation

class LotteryMachine {
    var unused: [[Int]]?
    func addCombo(prevCombo: [Int], var pivotList: [Int]) -> [([Int], [Int])] {
        
        return (0..<pivotList.count)
            .map {
                _ -> ([Int], [Int]) in
                (prevCombo + [pivotList.removeAtIndex(0)], pivotList)
        }
    }
    func combosOfLength(n: Int, m: Int) -> [[Int]] {
        
        return [Int](1...m)
            .reduce([([Int](), [Int](0..<n))]) {
                (accum, _) in
                accum.flatMap(addCombo)
            }.map {
                $0.0
        }
        
        
    }
       func setDraftPositions(var standingsArray: [Team])->[Team]{
        var lottery: [Team]=[]
        var totalPossibilities: [[Int]]=combosOfLength(14, m: 4)
        var tempPossibilities = totalPossibilities;
        tempPossibilities.removeAll()
        var rand = Int(arc4random_uniform(UInt32(totalPossibilities.count)))
        var draw = totalPossibilities[rand]
        while (draw==(unused?.first)!) {
             rand = Int(arc4random_uniform(UInt32(totalPossibilities.count)))
             draw = totalPossibilities[rand]
        }
     
        s: for x in 0...13{
         
           for a in 0...(standingsArray[x].possibilities?.count)!-1{
             if(draw==standingsArray[x].possibilities![a]){
                standingsArray[x].setDraftingPosition(1)
                standingsArray[x].isLottery=true;
                lottery.append(standingsArray[x])
                for i in 0...13 {
                    if(standingsArray[i].firstName != standingsArray[x].firstName!) {
                        
                        for j in 0...(standingsArray[i].possibilities?.count)! - 1{
                            tempPossibilities.append(standingsArray[i].possibilities![j])
                        }
                    }
                }
                standingsArray.removeAtIndex(x)
                break s;
            }
            }
            
        }
        
        rand = Int(arc4random_uniform(UInt32(tempPossibilities.count)))
        draw=tempPossibilities[rand]
        while (draw==(unused?.first)!) {
            rand = Int(arc4random_uniform(UInt32(tempPossibilities.count)))
            draw = tempPossibilities[rand]
        }
        tempPossibilities.removeAll()
        d:for y in 0...12{
            for b in 0...((standingsArray[y].possibilities?.count))!-1{
                if(draw==standingsArray[y].possibilities![b]){
                    standingsArray[y].setDraftingPosition(2)
                    standingsArray[y].isLottery=true;
                    lottery.append(standingsArray[y])
                    for i in 0...12 {
                        if(standingsArray[i].firstName != standingsArray[y].firstName!) {
                            for j in 0...(standingsArray[i].possibilities?.count)!-1{
                                tempPossibilities.append(standingsArray[i].possibilities![j])
                            }
                        }
                    }

                    standingsArray.removeAtIndex(y)
                    break d;
                }
            }
            
        }
       
        rand = Int(arc4random_uniform(UInt32(tempPossibilities.count)))
        draw=tempPossibilities[rand]
        while (draw==(unused?.first)!) {
            rand = Int(arc4random_uniform(UInt32(tempPossibilities.count)))
            draw = tempPossibilities[rand]
        }
        tempPossibilities.removeAll()

        d:for z in 0...11{
            for c in 0...((standingsArray[z].possibilities?.count))!-1{
                if(draw==standingsArray[z].possibilities![c]){
                    standingsArray[z].setDraftingPosition(3)
                    standingsArray[z].isLottery=true;
                    lottery.append(standingsArray[z])
                    for i in 0...11 {
                        if(standingsArray[i].firstName != standingsArray[z].firstName!) {
                            for j in 0...(standingsArray[i].possibilities?.count)!-1{
                                tempPossibilities.append(standingsArray[i].possibilities![j])
                            }
                        }
                    }

                    standingsArray.removeAtIndex(z)
                    break d;
                }
            }
        }
        
        
          
          
            var l = 4
            for x in 0...standingsArray.count-1 {
                standingsArray[x].setDraftingPosition(l)
                if(standingsArray[x].draftingPosition<15) {
                    standingsArray[x].isLottery=true
                }
                else {
                    standingsArray[x].isLottery=false
                }
                l++
            }
        
        for i in 0...standingsArray.count-1 {
            lottery.append(standingsArray[i])
        }
            return lottery
        }

       
    
        
    
    func setPossibleCombinations(standingsArray: [Team])->[Team]{
        var totalPossibilities = combosOfLength(14, m: 4)
        var teamPossibilities: [[Int]]=totalPossibilities;
        var temp=standingsArray
        var rand:Int;
        
        teamPossibilities.removeAll()
        for x in 1...250{
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        temp[0].setPossibilities(teamPossibilities)
        teamPossibilities.removeAll()
        
        for x in 1...199 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
        
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);        }
        
        
        
        temp[1].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...156{
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[2].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        
        
        for x in 1...119 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);               }
        
        temp[3].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        
        
        for x in 1...88 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[4].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        
        
        for x in 1...63 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[5].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...43 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[6].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...28 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[7].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...17 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[8].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...11 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[9].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...8 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[10].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...7 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[11].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...6 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);
            
        }
        
        temp[12].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        
        for x in 1...5 {
            
            rand=Int(arc4random_uniform(UInt32(totalPossibilities.count)))
            
            teamPossibilities.append(totalPossibilities[rand])
            
            totalPossibilities.removeAtIndex(rand);                }
        
        
        
        temp[13].setPossibilities(teamPossibilities)
        
        teamPossibilities.removeAll()
        unused=totalPossibilities
        return temp;
    }
    func 

    
    }





