//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by Megan Rivera Hammock on 2/14/25.
//
import Foundation

// Struct that handles the logic and progression of the adventure story
struct AdventureLogic {
    
    // dictionary that holds the AdventureNodes,
    // where each key is the node index and value is theAdventureNode
    var nodes: [Int: AdventureNode]
    
    var nodeIndex: Int = 1
    
    // Initializer to set up the initial set of nodes from the 'storyNodes' dictionary
    init() {
        self.nodes = storyNodes
    }
    
    // Hardcoded dictionary containing all the AdventureNodes,
    // representing different points in the story
    let storyNodes = [
        1: AdventureNode("You, Little Red Riding Hood, are on your way to Grandma's house with a basket of goodies, but you forgot the way! You find yourself at a fork in the road. One way leads down a dark path through the Enchanted Forest, the other leads to a trail by the river. Which way do you choose?",
            Choice("You decide to venture through the Enchanted Forest.", 2),
            Choice("You follow the trail by the river.", 3)),
        2: AdventureNode("As you walk down the dark path, you hear a rustle in the bushes. Suddenly, the Big Bad Wolf appears! He challenges you to a riddle. Do you choose to play his game?",
            Choice("You decide to answer the riddle.", 4),
            Choice("You try to trick the wolf.", 5)),
        3: AdventureNode("You follow the trail by the river. Eventually, you run into the Three Little Pigs working on their homes near the riverbank. Finally, maybe they can help you find your way to Grandma's house!",
            Choice("You ask the first little pig for directions.", 6),
            Choice("You ask the third little pig for directions.", 7)),
        4: AdventureNode("You decide to answer the riddle. The Big Bad Wolf chuckles and says, 'I am taken from a mine and placed in a wooden case, from which I am never released, yet I am used by almost every household. What am I?'",
            Choice("You guess a pencil lead.", 8),
            Choice("You guess a match.", 9)),
        5: AdventureNode("You try to trick the wolf. He laughs heartily and says, 'I am an odd number. Take away one letter from me and I become even. What number am I?'",
            Choice("You guess seven (remove the 's' and it becomes 'even').", 10),
            Choice("You guess eleven (remove the 'e' and 'l' and it becomes 'even').", 11)),
        6: AdventureNode("The first little pig (who built his house of straws) says, 'Grandma's house? Oh, sure! Just take the shortcut through the hollow tree. It's the fastest way!' You look inside the hollow tree and it looks dark and creepy.",
            Choice("You enter the suspicious hollow tree.", 12),
            Choice("Ingore the Pig's advice and find your own way.", 13)),
        7: AdventureNode("The third little pig (who built his house of bricks) shakes his head and says, You can't trust shortcuts in the Enchanted Forest. You'll get lost eventually. The best way to Grandma's house is past the old gingerbrad house. The lady there might have directions... But isn't that where the witch lives?",
            Choice("Against your better judgement, you head to the old gingerbrad house.", 14),
            Choice("You can't risk it. You find your own way.", 15)),
        8: AdventureNode("You guess a pencil lead. The wolf laughs and says, 'Nope, not quite.' He grabs you and throws you into the river. You float downstream until you reach the shore... and find yourself back at the beginning of the Enchanted Forest.",
            Choice("You try again.", 1),
            Choice("You give up and go home.", 22)),
        9: AdventureNode("You guess a match. The wolf is confused by your answer. During his state of confusion, you run right past him! You see Grandma's house in the distance. You keep going, faster and faster, until you make it to Grandma's house right on time for supper.",
            Choice("You run inside Grandma's house in disbelief.", 23),
            Choice("", 0)),
        10: AdventureNode("You guess seven (remove the 's' and it becomes 'even'). The wolf laughs heartily and says, 'You are indeed clever!' He lets go of you and runs away into the woods. You keep walking until you eventually reach Grandma's house!",
            Choice("Tired but happy, you run inside Grandma's house to tell her all about your journey.", 23),
            Choice("", 0)),
        11: AdventureNode("You guess eleven (remove the 'e' and 'l' and it becomes 'even'). The wolf laughs and asks, 'Did you even try?' He grabs you and runs off. As he runs, he trips over a large, fallen branch. You take this opportunity to run.",
            Choice("You run east.", 16),
            Choice("You run west.", 17)),
        12: AdventureNode("You crawl through the hollow tree, only to realize it's a trap and you cannot escape. You are trapped inside and never make it to Grandma's house!",
            Choice("Oh no!", 22),
            Choice("", 0)),
        13: AdventureNode("You decide to find your own way. You wander deeper into the woods and find a trail of breadcrumbs. Huh? Who left those? Suddenly, two kids, Hansel and Gretel, pop out from behind a bush. 'Are you lost', they ask.",
            Choice("You decide to ask them for help finding Grandma's house.", 18),
            Choice("You don't quite trust them. You keep going alone.", 19)),
        14: AdventureNode("The sweet smell of cookies fill the air as you reach the Gingerbread House. A kind-looking lady opens the door. 'Lost dear? Come inside and rest', she says with a smile.",
            Choice("Go inside and play along", 20),
            Choice("Make an excuse and leave quickly.", 21)),
        15: AdventureNode("You take a long detour through the Enchanted Forest. The trees whisper, and shadows move. Suddenly, you hear a familiar voice calling your name. 'Grandma! Grandma!'",
            Choice("You follow the voice and run as fast as you can.", 23),
            Choice("You don't beleive your ears. This can't be right, so you turn around and start over.", 1)),
        16: AdventureNode("You run east, but the woods seem to go on forever. Maybe you made a wrong turn somewhere? None of this looks familiar to you. You are lost.",
            Choice("You decide to trace your steps back to the beginning.", 1),
            Choice("It's starting to get dark. You're scared of the dark.", 22)),
        17: AdventureNode("You run west. You are starting to feel hopeless when suddenly you smell the sweet scent of Grandma's cherry pie. As you get closer and closer, the smell grows stronger. Finally! You make it to Grandma's house!",
            Choice("You run inside and enjoy Grandma's pie!", 23),
            Choice("The journey here was more exciting. You go back to the entrance of the Enchanted Forest.", 1)),
        18: AdventureNode("Turns out, they're really good at navigating the forest. They lead you straight to Grandma's house.",
            Choice("You don't look back until you make it all the way there.", 23),
            Choice("You follow them back to the entrance of the Enchanted Forest.", 1)),
        19: AdventureNode("You have no idea where you're going. The sun is starting to set. You decide to follow the path back to go home.",
            Choice("You'll try to find Grandma's house tomorrow.", 22),
            Choice("Maybe Grandma should visit you instead!", 22)),
        20: AdventureNode("The lady really is a witch! But its too late and there is no way to leave. 'I guess you won't be making it to Grandma's house after all.', she says with a cackle.",
            Choice("Oh no!", 22),
            Choice("", 0)),
        21: AdventureNode("Smart move! You continue towards Grandma's house, but you sense someone is watching you...",
            Choice("You keep walking towards Grandma's house.", 23),
            Choice("You wander off the path, paranoid someone will follow you to Grandma's house.", 22)),
        22: AdventureNode("The End... Or is it?",
            Choice("Play again!", 1),
            Choice("", 0)),
        23: AdventureNode("You make it safely to Grandma's house! She greets you with a big smile and hugs you tightly. She's so happy to see you... But she noticed you forgot the milk and asked if you could go back out and bring her some.",
            Choice("You could never say no to Grandma!", 1),
            Choice("You can't risk going back right now. Maybe tomorrow...", 22))
    ]
    
    // Function returns the node index, used to fetch related image for background
    func getImageName() -> Int {
        return nodeIndex
    }
    
    // Function returns text of current story node
    func getStoryPrompt() -> String {
        return nodes[nodeIndex]!.text
    }
    
    // Function returns the current AdventureNode object based on nodeIndex
    func getCurrentNode() -> AdventureNode? {
        return nodes[nodeIndex]!
    }
    
    // Function returns the first choice available at the current node
    func getChoiceOne() -> Choice {
        return nodes[nodeIndex]?.choiceOne ?? Choice("", 0)
    }
    
    // Function returns the second choice available at the current node
    func getChoiceTwo() -> Choice {
        return nodes[nodeIndex]?.choiceTwo ?? Choice("", 0)
    }
}
