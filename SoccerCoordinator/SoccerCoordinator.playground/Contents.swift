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

var letters: [String] = []

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

/*  COMMENTING THIS OUT BUT YOU CAN UNCOMMENT TO TEST EXTENSABILITY.  JUST ADD THESE TWO DICTIONARIES TO THE
    PLAYERS ARRAY.
//Added a couple other players to show that my code is expandable
var bobNewhart: [String: Any] = ["name": "Bob Newhart", "height": 35, "experienced": false, "guardian names": "John and Nancy Newhart"]
var joanNewhart: [String: Any] = ["name": "Joan Newhart", "height": 48, "experienced": true, "guardian names": "John and Nancy Newhart"]
*/

//Array to hold each player
var players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]
 
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
func assignPlayerRanking(player: [String: Any], experience: Bool) -> String{
    
    //Intialize a variable to override with each tier name as a String.
    var playerRanking: String = "Not Assigned"
    
    print("ASSIGN PLAYER RANKING - EXPERIENCE: \(experience)")

    //Store player name from player dictionary
    let playerName = player["name"]
    
    //Sort players into rankings based upon their height and experience.
    //The taller the player and the more experienced the higher they rank.
    if experience == true{
        //set current tier
        playerRanking = "tier 1"
       
        print("IN assignPlayerRanking - Tier1 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")
        
        //Add playerName to global tier array for later use
        tier1.append(playerName as! String)
        
        //return tier
        return playerRanking
    } else if experience == false{
        //set current tier
        playerRanking = "tier 2"
        
        print("IN assignPlayerRanking - Tier2 - Player: \(String(describing: playerName)) Tier: \(playerRanking)")

        //Add playerName to global tier array for later use
        tier2.append(playerName as! String)
        
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

//NOTE:  I haven't passed the player dictionary along so this is my solution for finding the guardian names based off
//off the name key in the players dictionaries.  If you can think of a cleaner way to do this let me know.  This runs
//really slow in the playground when all the print statements are enabled so I don't know if this is a very
//well optimized method but I know in the long run I won't be using playgrounds anyway.

//Get names of guardians based off of the player name
func getGuardianName(playerName: String) -> String{
    
    //Get count of the number of players in players array -1.
    let playersCount = players.count - 1
    
    var dict: [String:Any] = [:]
    
    //Iterate over the players array
    for playerNumber in 0...playersCount{
        
        //for player in players iterate over key and value
        for (key,value) in players[playerNumber]{
            
            //print("In getGuardianName() - Iterating over Players Array - player: \(players[playerNumber]) Key: \(key) Value: \(value)")

            //If key == playerName passed in then save dictionary name
            if key == "name" && value as! String == playerName{
                dict = players[playerNumber]
                print("Assigning Dictionary - dict: \(dict)")
            }
        }
        
        //If Dictionary is empty then do nothing and return default values below
        if dict.isEmpty{
            print("In getGuardianName() - dict is Empty")
        }
        else
        {
            //Else if Dictionary not empty:
            
            //Iterate over key value pairs in saved dictionary
            for (key,value) in dict{
                
                //print("In getGuardianName() - Iterating over Guardians Array - dict: \(dict) Key: \(key) Value: \(value)")
                
                //If key matches "guardian names" then return value as! String
                if key == "guardian names"{
                    
                    print("In getGuardianName() - Found Guardian Name - Returning: \(value)")
                    return value as! String
                }
            }
        }
    }
    return "DEFAULT GUARDIAN - YOU SHOULDN'T GET HERE."
}

//Create the letter for the player and their guardians
func createLetterForPlayer(team: [String]){
    //print("In createLetterForPlayer - Team: \(team)")
    
    let count = team.count - 1
    
    for playerNumber in 0...count{
        
        //let player = players[playerNumber]
        
        var teamAssigned = false
        //let playerName = ""
        
        letters.append("**************************")
        letters.append("*** LETTER TO GUARDIAN ***")
        letters.append("**************************")
        letters.append("Dear \(team[playerNumber]),")
        //playerName = value as! String

        let guardianName = getGuardianName(playerName: team[playerNumber])
        letters.append("Please tell your guardian(s), \(guardianName),")

        //Print second part of letter.
        if teamAssigned == false{
            //let team = getPlayerTeam(name: playerName)
            
            if team == teamSharks{
                letters.append("that you have been assigned to Team Sharks.")
            }
            else if team == teamDragons{
                letters.append("that you have been assigned to Team Dragons.")
            }
            else if team == teamRaptors{
                letters.append("that you have been assigned to Team Raptors.")
            }
            
            if team == teamSharks{
                letters.append("Your first practice date is on March 17th at 3pm.")
            }
            else if team == teamDragons{
                letters.append("Your first practice date is on March 17th at 1pm.")
            }
            else if team == teamRaptors{
                letters.append("Your first practice date is on March 18th at 1pm.")
            }

            teamAssigned = true
        }
    }
}

func printLettersToConsole(){
    let lettersCount = letters.count - 1
    
    for lettersNumber in 0...lettersCount{
        print(letters[lettersNumber])
    }
}
//*** BASE LOGIC ***

//Get count of the number of players in players array -1.
let count = players.count - 1

//Iterate over the players array
for playerNumber in 0...count{
    
    //Rank players by experience
    let playerExperience = sortPlayersByExperience(player: players[playerNumber])
    print("experience: \(playerExperience)")
    
    //REMEMBER TO UPDATE THE VALUES PASSED IN HERE TOO
    let playerRanking = assignPlayerRanking(player: players[playerNumber], experience: playerExperience.1)
    print("BASE LOGIC - Ranking: \(playerRanking)")
    
    print(players[playerNumber])
    
}

//Just calling each tier to view in playground to the right. -->
tier1
tier2

//Assign Players to Teams for Each Tier Based on Ranking
print("**************")
print("Tier 1 Players")
print("**************")
assignPlayersToTeams(tier: tier1)
print("**************")
print("Tier 2 Players")
print("**************")
assignPlayersToTeams(tier: tier2)

//Calling each team to be viewed in the playground to the right.  -->
teamSharks
teamDragons
teamRaptors

createLetterForPlayer(team: teamSharks)
createLetterForPlayer(team: teamDragons)
createLetterForPlayer(team: teamRaptors)

//Calling Letters so it can be viewed in Playgrground.  -->
letters

printLettersToConsole()


