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

//variable iterate over for each team in the assignPlayersToTeams function.
//Once someone is assigned to one team it moves the next team.  Once it gets
//to last team it starts over with the first team.
var teamPosition = 1

//Global Variable for Each Team
var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

//Dictionary for each player
//** REVIEWERS: String: Any was what was suggested by Xcode for assigning multiple value types in a dictionary.
//If there is something better to use let me know.
var joeSmith: [String: Any] = ["name": "Joe Smith", "height": 42, "experienced": true, "guardian names": "Jim and Jan Smith"]
var jillTanner: [String: Any] = ["name": "Jill Tanner", "height": 36, "experienced": true, "guardian names": "Clara Tanner"]
var billBon: [String: Any] = ["name": "Bill Bon", "height": 43, "experienced": true, "guardian names": "Sara and Jenny Bon"]
var evaGordon: [String: Any] = ["name": "Eva Gordon", "height": 45, "experienced": false, "guardian names": "Wendy and Mike Gordon"]
var mattGill: [String: Any] = ["name": "Matt Gill", "height": 40, "experienced": false, "guardian names": "Charles and Sylvia Gill"]
var kimmyStein: [String: Any] = ["name": "Kimmy Stein", "height": 41, "experienced": false, "guardian names": "Bill and Hillary Stein"]
var sammyAdams: [String: Any] = ["name": "Sammy Adams", "height": 45, "experienced": false, "guardian names": "Jeff Adams"]
var karlSaygan: [String: Any] = ["name": "Karl Saygan", "height": 42, "experienced": true, "guardian names": "Heather Bledsoe"]
var suzaneGreenberg: [String: Any] = ["name": "Suzan Greenberg", "height": 44, "experienced": true, "guardian names": "Henrietta Dumas"]
var salDali: [String: Any] = ["name": "Sal Dali", "height": 41, "experienced": false, "guardian names": "Gala Dali"]
var joeKavalier: [String: Any] = ["name": "Joe Kavalier", "height": 39, "experienced": false, "guardian names": "Sam and Elaine Kavalier"]
var benFinkelstein: [String: Any] = ["name": "Ben Finkelstein", "height": 44, "experienced": false, "guardian names": "Aaron and Jill Finkelstein"]
var diegoSoto: [String: Any] = ["name": "Diego Soto", "height": 41, "experienced": true, "guardian names": "Robin and Sarika Soto"]
var chloeAlaska: [String: Any] = ["name": "Choloe Alaska", "height": 47, "experienced": false, "guardian names": "David and Jamie Alaska"]
var arnoldWillis: [String: Any] = ["name": "Arnold Willis", "height": 43, "experienced": false, "guardian names": "Claire Willis"]
var phillipHelm: [String: Any] = ["name": "Phillip Helm", "height": 44, "experienced": true, "guardian names": "Thomas Helm and Eva Jones"]
var lesClay: [String: Any] = ["name": "Les Clay", "height": 42, "experienced": true, "guardian names": "Wynonna Brown"]
var herschelKrustofski: [String: Any] = ["name": "Herschel Krustofski", "height": 45, "experienced": true, "guardian names": "Hyman and Rachel Krustofski"]

//Added a couple other players to show that my code is expandable
var bobNewhart: [String: Any] = ["name": "Bob Newhart", "height": 35, "experienced": false, "guardian names": "John and Nancy Newhart"]
var joanNewhart: [String: Any] = ["name": "Joan Newhart", "height": 48, "experienced": true, "guardian names": "John and Nancy Newhart"]


//Array to hold each player
var players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeSmith, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski, bobNewhart, joanNewhart]

//Function to sort players by height.  Passing in the player from players. Returning playerName and height ranking.
func sortPlayersByHeight(player: [String: Any]) -> (String){
    
    print("sortPlayersByHeight - Player: \(player)")
    
    //assigning player height to constant as Int.  Have to convert otherwise it gives a type mismatch.
    let height = player["height"] as! Int
    
    var player1 = player
    
    //sort players into rankings by height
    if height >= 46{
        let heightBracket = "tallest"
        //Storing value in player dictionary.
        player1["heightBracket"] = heightBracket
        return (heightBracket)
    }
    else if height >= 44 && height <= 45{
        let heightBracket = "tall"
        //Storing value in player dictionary.
        player1["heightBracket"] = heightBracket
        return (heightBracket)
    }
    else if height >= 41 && height <= 43{
        let heightBracket = "medium"
        //Storing value in player dictionary.
        player1["heightBracket"] = heightBracket
        return (heightBracket)
    }
    else if height >= 38 && height <= 40{
        let heightBracket = "short"
        //Storing value in player dictionary.
        player1["heightBracket"] = heightBracket
        return (heightBracket)
    }
    else if height <= 37{
        let heightBracket = "shortest"
        //Storing value in player dictionary.
        player1["heightBracket"] = heightBracket
        return (heightBracket)
    }
    return ("Error Height")

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
    
    print("ASSIGN PLAYER RANKING - HEIGHT: \(height) EXPERIENCE: \(experience)")

    //Store player name from player dictionary
    let playerName = player["name"]
    
    //Sort players into rankings based upon their height and experience.
    //The taller the player and the more experienced the higher they rank.
    if height == "tallest" && experience == true{
        //set current tier
        playerRanking = "tier 1"
       
        print("IN assignPlayerRanking - Tier1 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier1.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if (height == "tall" && experience == true) || (height == "tallest" && experience == false){
        //set current tier
        playerRanking = "tier 2"
        
        print("IN assignPlayerRanking - Tier2 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")

        //Add playerName to global tier array for later use
        tier2.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if (height == "medium" && experience == true) || (height == "tall" && experience == false){
        //set current tier
        playerRanking = "tier 3"
   
        print("IN assignPlayerRanking - Tier3 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier3.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if (height == "short" && experience == true) || (height == "medium" && experience == false){
        //set current tier
        playerRanking = "tier 4"

        print("IN assignPlayerRanking - Tier4 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier4.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if (height == "shortest" && experience == true) || (height == "short" && experience == false){
        //set current tier
        playerRanking = "tier 5"
        
        print("IN assignPlayerRanking - Tier5 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier5.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if height == "shortest" && experience == false{
        //set current tier
        playerRanking = "tier 6"
        
        print("IN assignPlayerRanking - Tier6 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier6.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else {
        //If none of the statements match then return default statement.
        return playerRanking
    }
}

//Function to assign players to teams passing in each tier as a string
func assignPlayersToTeams(tier: [String]){
    
    //if the tier is not empty
    if tier.count > 0{
        
        //assign tier count to constant
        let count = tier.count - 1
        
        //for loop to iterate through each member of a tier
        for number in 0...count{
            
            //Print player from this tier to Console
            print("ASSIGNING PLAYER: \(tier[number])")
            
            //Assign name to constant
            let name = tier[number]
            
            //Check to see what team we are currently assigning players to.
            if teamPosition == 1
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Sharks")
                
                //Append each name to the team's global array
                teamSharks.append(name)
                
                print("Team Sharks Count: \(teamSharks.count - 1)")
                
                //set team position to next team
                teamPosition = 2
            }
            else if teamPosition == 2
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Dragons")
                
                //Append each name to the team's global array
                teamDragons.append(name)
                
                print("Team Dragons Count: \(teamDragons.count - 1)")
                
                //set team position to next team
                teamPosition = 3
            }
            else if teamPosition == 3
            {
                //print name and team for each player
                print("Name: \(tier[number]), Team: Team Raptors")

                //Append each name to the team's global array
                teamRaptors.append(name)
                
                print("Team Raptors Count: \(teamRaptors.count - 1)")
                
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
                
                print("teamPosition: \(teamPosition)")
                print("SHARKS COUNT: \(teamSharks.count)")
                print("DRAGONS COUNT: \(teamDragons.count)")
                print("RAPTORS COUNT: \(teamRaptors.count)")
            
            }
        }
    } else {
        //If you get here it just means that there are no players in this Tier.  In this example both Tier 1 and 6 are empty with default players.
        print("--Empty Tier--")
    }
}

//Check to see if player is on Sharks Team
func isSharksPlayer(name: String) -> (Bool)
{
    let sharksCount = teamSharks.count - 1

    for player in 0...sharksCount{
        
        //If player name appears in teamSharks then return true
        if teamSharks[player] == name{
            //print("IN getPlayerTeam - Player: \(player)")
            return true
        }
    }
    return false
}

//Check to see if player is on Dragons Team
func isDragonsPlayer(name: String) -> (Bool)
{
    let dragonsCount = teamDragons.count - 1
    
    for player in 0...dragonsCount{
        
        //If player name appears in teamDragons then return true
        if teamDragons[player] == name{
            //print("IN getPlayerTeam - Player: \(player)")
            return true
        }
    }
    return false
}

//Check to see if player is on the Dragons Team
func isRaptorsPlayer(name: String) -> (Bool)
{
    let raptorsCount = teamRaptors.count - 1
    
    for player in 0...raptorsCount{
        
        //If player name appears in teamRaptors then return true
        if teamRaptors[player] == name{
            //print("IN getPlayerTeam - Player: \(player)")
            return true
        }
    }
    return false
}

//get Team of player by player name
func getPlayerTeam(name: String) -> (String){
    if isSharksPlayer(name: name){
        return "Team Sharks"
    }
    else if isDragonsPlayer(name: name){
        return "Team Dragons"
    }
    else if isRaptorsPlayer(name: name){
        return "Team Raptors"
    }
    return "Default in getPlayerTeam - You Shouldn't Get Here"
}

//Create the letter for the player and their guardians
func createLetterForPlayer(team: [String]){
    //print("In createLetterForPlayer - Team: \(team)")
    
    let count = team.count - 1
    
    for playerNumber in 0...count{
        
        let player = players[playerNumber]
        
        var teamAssigned = false
        var playerName = ""
        
        print("**************************")
        print("*** LETTER TO GUARDIAN ***")

        //Iterate through each player in players
        for (key,value) in player{
            
            //Print first part of letter
            if key == "name"{
            
                print("**************************")
                print("Dear \(value),")
                playerName = value as! String
            }
            else if key == "guardian names"{
                print("Please tell your guardian(s), \(value),")
            }
        }
        
        //Print second part of letter.
        if teamAssigned == false{
            let team = getPlayerTeam(name: playerName)
            print("that you have been assigned to \(team).")
            if team == "Team Sharks"{
                print("Your first practice date is on March 17th at 3pm.")
            }
            else if team == "Team Dragons"{
                print("Your first practice date is on March 17th at 1pm.")
            }
            else if team == "Team Raptors"{
                print("Your first practice date is on March 18th at 1pm.")
            }
            teamAssigned = true
        }
    }
}

//*** BASE LOGIC ***

//Get count of the number of players in players array -1.
let count = players.count - 1

//Iterate over the players array
for playerNumber in 0...count{
    
    //Rank players by height
    let playerHeight = sortPlayersByHeight(player: players[playerNumber])
    players[playerNumber].updateValue(playerHeight, forKey: "heightBracket")
    print("Player Info: \(players[playerNumber])")
    
    
    //print("height: \(players["heightBracket"])")
    
    //Rank players by experience
    let playerExperience = sortPlayersByExperience(player: players[playerNumber])
    print("experience: \(playerExperience)")
    
    //Rank players by height and experience
    
    //****This is how you reference the code for the invitations****
    
    var heightBracket = "Default"
    
    //Get HeightBracket for players
    for (key,value) in players[playerNumber]{
        
        if key == "heightBracket"{
            heightBracket = value as! String
            print("Player Height Bracket: \(heightBracket)")
        }
        
        //REMEMBER TO UPDATE THE VALUES PASSED IN HERE TOO
        let playerRanking = assignPlayerRanking(player: players[playerNumber], height: heightBracket, experience: playerExperience.1)
        print("BASE LOGIC - Ranking: \(playerRanking)")
    }
    print(players[playerNumber])
    
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

createLetterForPlayer(team: teamSharks)
createLetterForPlayer(team: teamDragons)
createLetterForPlayer(team: teamRaptors)


