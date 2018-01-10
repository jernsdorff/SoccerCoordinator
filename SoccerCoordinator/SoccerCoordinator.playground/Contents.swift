/****** SOCCER COORDINATOR ********
        by Jernsdorff
***********************************/

/*  PLAYER DATA - AS GIVEN BY TEAMTREEHOUSE
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

//Global Variables for Each Rank
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
//** REVIEWERS: String: Any was what was suggested by Xcode for assigning multiple value types in a dictionary.
//If there is something better to use let me know.
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

//Function to sort players by height.  Passing in the player from players. Returning playerName and height ranking.
func sortPlayersByHeight(player: [String: Any]) -> (String, String){

    //assigning player name as string to a constant.  Have to convert otherwise it gives a type mismatch.
    let playerName = player["name"] as! String
    
    //assigning player height to constant as Int.  Have to convert otherwise it gives a type mismatch.
    let height = player["height"] as! Int
    
    //sort players into rankings by height
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

//Function to sort players by whether they are experienced or not.  Pass in player.  Return playerName and bool for whether they are experienced.
func sortPlayersByExperience(player: [String: Any]) -> (String,Bool){
    
    //Store player name as String in constant.
    let playerName = player["name"] as! String
    
    //Store whether the player is experienced as a bool.
    let isExperienced = player["experienced"] as! Bool
    
    //If experienced return true else false.
    if isExperienced == true{
        return (playerName, true)
    }
    else{
        return (playerName, false)
    }
}

//Function to assign player an overall ranking based upon their hight and experience.
func assignPlayerRanking(player: [String: Any], height: String, experience: Bool) -> String{
    
    //Intialize a variable to override with each tier name as a String.
    var playerRanking: String = "Not Assigned"
    
    //Sort players into rankings based upon their height and experience.
    //The taller the player and the more experienced the higher they rank.
    if height == "tallest" && experience == true{
        //set current tier
        playerRanking = "tier 1"
        
        //append player name as a string to global tier variable
        tier1.append(player["name"] as! String)
        
        //return tier
        return playerRanking
    } else if (height == "tall" && experience == true) || (height == "tallest" && experience == false){
        //set current tier
        playerRanking = "tier 2"

        //append player name as a string to global tier variable
        tier2.append(player["name"] as! String)

        //return tier
        return playerRanking
    } else if (height == "medium" && experience == true) || (height == "tall" && experience == false){
        //set current tier
        playerRanking = "tier 3"
        
        //append player name as a string to global tier variable
        tier3.append(player["name"] as! String)
        
        //return tier
        return playerRanking
    } else if (height == "short" && experience == true) || (height == "medium" && experience == false){
        //set current tier
        playerRanking = "tier 4"
        
        //append player name as a string to global tier variable
        tier4.append(player["name"] as! String)
        
        //return tier
        return playerRanking
    } else if (height == "shortest" && experience == true) || (height == "short" && experience == false){
        //set current tier
        playerRanking = "tier 5"
        
        //append player name as a string to global tier variable
        tier5.append(player["name"] as! String)
        
        //return tier
        return playerRanking
    } else if height == "shortest" && experience == false{
        //set current tier
        playerRanking = "tier 6"
        
        //append player name as a string to global tier variable
        tier6.append(player["name"] as! String)
        
        //return tier
        return playerRanking
    } else {
        //If none of the statements match then return default statement.
        return playerRanking
    }
}

//Function to assign players to teams passing in each tier as a string
func assignPlayersToTeams(tier: [String]){
    
    //variable to iterate over for each team.  Once someone is assigned
    //to one team it moves the next team.  Once it gets to last team
    //it starts over with the first team.
    var teamPosition = 1
    
    //if the tier is not empty
    if tier.count > 0{
        
        //assign tier count to constant
        let count = tier.count - 1
        
        //for loop to iterate through each member of a tier
        for number in 0...count{
            
            //Print player from this tier to Console
            print(tier[number])
            
            //Assign name to constant
            let name = tier[number]
            
            //Check to see what team we are currently assigning players to and make sure each team count is <=4
            //Note I think this is a magic number.  Will have to fix team sizes to be variable.
            //***** FIX THIS *******
            if teamPosition == 1 && ((teamSharks.count - 1) <= 4)
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Sharks")
                
                //Append each name to the team's global array
                teamSharks.append(name)
                
                //set team position to next team
                teamPosition = 2
            }
            else if teamPosition == 2 && ((teamDragons.count - 1) <= 4)
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Dragons")
                
                //Append each name to the team's global array
                teamDragons.append(name)

                //set team position to next team
                teamPosition = 3
            }
            else if teamPosition == 3 && ((teamRaptors.count - 1) <= 4)
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Raptors")

                //Append each name to the team's global array
                teamRaptors.append(name)
                
                //set team position back to first team
                teamPosition = 1
            }
            else
            {
                //It should never get here but if it does you know something is wrong.
                //This means players exist that aren't getting assigned.
                print("*********************")
                print("You Shouldn't Be Here - FIX THIS TOMORROW")
                print("*********************")
            }
        }
    } else {
        //If you get here it just means that there are no players in this Tier.  In this example both Tier 1 and 6 are empty.
        print("--Empty Tier--")
    }
}

//*** BASE LOGIC ***

//Get count of the number of players in players array -1.
let count = players.count - 1

//Iterate over the players array
for playerNumber in 0...count{
    
    //Rank players by height
    let playerHeight = sortPlayersByHeight(player: players[playerNumber])
    print("height: \(playerHeight)")
    
    //Rank players by experience
    let playerExperience = sortPlayersByExperience(player: players[playerNumber])
    print("experience: \(playerExperience)")
    
    //Rank players by height and experience
    let playerRanking = assignPlayerRanking(player: players[playerNumber], height: playerHeight.1, experience: playerExperience.1)
    print("ranking: \(playerRanking)")
}

//Just calling each tier to view in playground to the right. -->
tier1
tier2
tier3
tier4
tier5
tier6

//Assign Players to Teams for Each Tier Based on Ranking
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

//Calling each team to be viewed in the playground to the right.  -->
teamSharks
teamDragons
teamRaptors





