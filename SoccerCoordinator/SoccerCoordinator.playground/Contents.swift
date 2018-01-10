/****** SOCCER COORDINATOR ********
        by Jernsdorff
***********************************/

/*  PLAYER DATA
 Joe Smith    42    YES    Jim and Jan Smith
 Jill Tanner    36    YES    Clara Tanner
 Bill Bon    43    YES    Sara and Jenny Bon
 Eva Gordon    45    NO    Wendy and Mike Gordon
 Matt Gill    40    NO    Charles and Sylvia Gill
 Kimmy Stein    41    NO    Bill and Hillary Stein
 Sammy Adams    45    NO    Jeff Adams
 Karl Saygan    42    YES    Heather Bledsoe
 Suzane Greenberg    44    YES    Henrietta Dumas
 Sal Dali    41    NO    Gala Dali
 Joe Kavalier    39    NO    Sam and Elaine Kavalier
 Ben Finkelstein    44    NO    Aaron and Jill Finkelstein
 Diego Soto    41    YES    Robin and Sarika Soto
 Chloe Alaska    47    NO    David and Jamie Alaska
 Arnold Willis    43    NO    Claire Willis
 Phillip Helm    44    YES    Thomas Helm and Eva Jones
 Les Clay    42    YES    Wynonna Brown
 Herschel Krustofski    45    YES    Hyman and Rachel Krustofski
*/

//Global Variables for Each Ranking Tier
var tier1: [String] = []
var tier2: [String] = []
var tier3: [String] = []
var tier4: [String] = []
var tier5: [String] = []
var tier6: [String] = []

//Global Variable for Each Team
var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

//Dictionary for each player
let joeSmith: [String: Any] = ["name": "Joe Smith", "height": 42, "experienced": true, "guardian names": "Jim and Jan Smith"]
let jillTanner: [String: Any] = ["name": "Jill Tanner", "height": 36, "experienced": true, "guardian names": "Clara Tanner"]
let billBon: [String: Any] = ["name": "Bill Bon", "height": 43, "experienced": true, "guardian names": "Sara and Jenny Bon"]
let evaGordon: [String: Any] = ["name": "Eva Gordon", "height": 45, "experienced": false, "guardian names": "Wendy and Mike Gordon"]
let mattGill: [String: Any] = ["name": "Matt Gill", "height": 40, "experienced": false, "guardian names": "Charles and Sylvia Gill"]
let kimmyStein: [String: Any] = ["name": "Kimmy Stein", "height": 41, "experienced": false, "guardian names": "Bill and Hillary Stein"]
let sammyAdams: [String: Any] = ["name": "Sammy Adams", "height": 45, "experienced": false, "guardian names": "Jeff Adams"]
let karlSaygan: [String: Any] = ["name": "Karl Saygan", "height": 42, "experienced": true, "guardian names": "Heather Bledsoe"]
let suzaneGreenberg: [String: Any] = ["name": "Suzan Greenberg", "height": 44, "experienced": true, "guardian names": "Henrietta Dumas"]
let salDali: [String: Any] = ["name": "Sal Dali", "height": 41, "experienced": false, "guardian names": "Gala Dali"]
let joeKavalier: [String: Any] = ["name": "Joe Kavalier", "height": 39, "experienced": false, "guardian names": "Sam and Elaine Kavalier"]
let benFinkelstein: [String: Any] = ["name": "Ben Finkelstein", "height": 44, "experienced": false, "guardian names": "Aaron and Jill Finkelstein"]
let diegoSoto: [String: Any] = ["name": "Diego Soto", "height": 41, "experienced": true, "guardian names": "Robin and Sarika Soto"]
let chloeAlaska: [String: Any] = ["name": "Choloe Alaska", "height": 47, "experienced": false, "guardian names": "David and Jamie Alaska"]
let arnoldWillis: [String: Any] = ["name": "Arnold Willis", "height": 43, "experienced": false, "guardian names": "Claire Willis"]
let phillipHelm: [String: Any] = ["name": "Phillip Helm", "height": 44, "experienced": true, "guardian names": "Thomas Helm and Eva Jones"]
let lesClay: [String: Any] = ["name": "Les Clay", "height": 42, "experienced": true, "guardian names": "Wynonna Brown"]
let herschelKrustofski: [String: Any] = ["name": "Herschel Krustofski", "height": 45, "experienced": true, "guardian names": "Hyman and Rachel Krustofski"]

//Array to hold each player
let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeSmith, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

func sortPlayersByHeight(player: [String: Any]) -> (String, String){

    let playerName = player["name"] as! String
    let height = player["height"] as! Int
    
    if height >= 46{
        return (playerName, "tallest")
    }
    else if height >= 44 && height <= 45{
        return (playerName, "tall")
    }
    else if height >= 41 && height <= 43{
        return (playerName, "medium")
    }
    else if height >= 38 && height <= 40{
        return (playerName, "short")
    }
    else if height <= 37{
        return (playerName, "shortest")
    }
    return ("Error Name", "Error Height")

}

func sortPlayersByExperience(player: [String: Any]) -> (String,Bool){
    
    let playerName = player["name"] as! String
    let isExperienced = player["experienced"] as! Bool
    
    if isExperienced == true{
        return (playerName, true)
    }
    else{
        return (playerName, false)
    }
}

func assignPlayerRanking(player: [String: Any], height: String, experience: Bool) -> String{
    
    var playerRanking: String = "Not Assigned"
    
    if height == "tallest" && experience == true{
        playerRanking = "tier 1"
        tier1.append(player["name"] as! String)
        return playerRanking
    } else if (height == "tall" && experience == true) || (height == "tallest" && experience == false){
        playerRanking = "tier 2"
        tier2.append(player["name"] as! String)
        return playerRanking
    } else if (height == "medium" && experience == true) || (height == "tall" && experience == false){
        playerRanking = "tier 3"
        tier3.append(player["name"] as! String)
        return playerRanking
    } else if (height == "short" && experience == true) || (height == "medium" && experience == false){
        playerRanking = "tier 4"
        tier4.append(player["name"] as! String)
        return playerRanking
    } else if (height == "shortest" && experience == true) || (height == "short" && experience == false){
        playerRanking = "tier 5"
        tier5.append(player["name"] as! String)
        return playerRanking
    } else if height == "shortest" && experience == false{
        playerRanking = "tier 6"
        tier6.append(player["name"] as! String)
        return playerRanking
    } else {
        return playerRanking
    }
}

let count = players.count - 1

for playerNumber in 0...count{
    let playerHeight = sortPlayersByHeight(player: players[playerNumber])
    print("height: \(playerHeight)")
    
    let playerExperience = sortPlayersByExperience(player: players[playerNumber])
    print("experience: \(playerExperience)")
    
    let playerRanking = assignPlayerRanking(player: players[playerNumber], height: playerHeight.1, experience: playerExperience.1)
    print("ranking: \(playerRanking)")
 }

tier1
tier2
tier3
tier4
tier5
tier6

func assignPlayersToTeams(tier: [String]){
    
    var teamPosition = 1
    
    if tier.count > 0{
        let count = tier.count - 1
        
        for number in 0...count{
            print(tier[number])
            
            let name = tier[number]
            
            if teamPosition == 1 && ((teamSharks.count - 1) <= 4)
            {
                print("Name: \(tier[number]), Team: Team Sharks")
                teamSharks.append(name)
                teamPosition = 2
            }
            else if teamPosition == 2 && ((teamDragons.count - 1) <= 4)
            {
                print("Name: \(tier[number]), Team: Team Dragons")
                teamDragons.append(name)
                teamPosition = 3
            }
            else if teamPosition == 3 && ((teamRaptors.count - 1) <= 4)
            {
                print("Name: \(tier[number]), Team: Team Raptors")
                teamRaptors.append(name)
                teamPosition = 1
            }
            else
            {
                print("*********************")
                print("You Shouldn't Be Here - FIX THIS TOMORROW")
                print("*********************")
            }
        }
    } else {
        print("Empty Tier")
    }
}


print("**************")
print("Tier 1 Players")
print("**************")
assignPlayersToTeams(tier: tier1)
print("**************")
print("Tier 2 Players")
print("**************")
assignPlayersToTeams(tier: tier2)
print("**************")
print("Tier 3 Players")
print("**************")
assignPlayersToTeams(tier: tier3)
print("**************")
print("Tier 4 Players")
print("**************")
assignPlayersToTeams(tier: tier4)
print("**************")
print("Tier 5 Players")
print("**************")
assignPlayersToTeams(tier: tier5)
print("**************")
print("Tier 6 Players")
print("**************")
assignPlayersToTeams(tier: tier6)

teamSharks
teamDragons
teamRaptors





