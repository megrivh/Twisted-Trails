//
//  ViewController.swift
//  MyAdventure
//
//  Created by Megan Rivera Hammock on 2/13/25.
//

import UIKit

struct AdventureLogic {
    var nodes: [Int: AdventureNode]
    var nodeIndex: Int = 0
    
    init() {
        self.nodes = storyNodes
    }
    
    let storyNodes = [
        0: AdventureNode("You, Little Red Riding Hood, are on your way to Grandma's house with a basket of goodies, but you forgot the way! You find yourself at a fork in the road. One way leads down a dark path through the Enchanted Forest, the other leads to a trail by the river. Which way do you choose?",
            Choice("You decide to venture through the Enchanted Forest.", 1),
            Choice("You follow the trail by the river.", 2)),
        1: AdventureNode("As you walk down the dark path, you hear a rustle in the bushes. Suddenly, the Big Bad Wolf appears! He challenges you to a riddle. Do you choose to play his game?",
            Choice("You decide to answer the riddle.", 3),
            Choice("You try to trick the wolf.", 4)),
        2: AdventureNode("You follow the trail by the river. Eventually, you run into the Three Little Pigs working on their homes near the riverbank. Finally, maybe they can help you find your way to Grandma's house!",
            Choice("You ask the first little pig for directions.", 5),
            Choice("You ask the third little pig for directions.", 6)),
        3: AdventureNode("You decide to answer the riddle. The Big Bad Wolf chuckles and says, 'I am taken from a mine and placed in a wooden case, from which I am never released, yet I am used by almost every household. What am I?'",
            Choice("You guess a pencil lead.", 7),
            Choice("You guess a match.", 8)),
        4: AdventureNode("You try to trick the wolf. He laughs heartily and says, 'I am an odd number. Take away one letter from me and I become even. What number am I?'",
            Choice("You guess seven (remove the 's' and it becomes 'even').", 9),
            Choice("You guess eleven (remove the 'e' and 'l' and it becomes 'even').", 10)),
        5: AdventureNode("The first little pig (who built his house of straws) says, 'Grandma's house? Oh, sure! Just take the shortcut through the hollow tree. It's the fastest way!' You look inside the hollow tree and it looks dark and creepy.",
            Choice("You enter the suspicious hollow tree.", 11),
            Choice("Ingore the Pig's advice and find your own way.", 12)),
        6: AdventureNode("The third little pig (who built his house of bricks) shakes his head and says, You can't trust shortcuts in the Enchanted Forest. You'll get lost eventually. The best way to Grandma's house is past the old gingerbrad house. The lady there might have directions... But isn't that where the witch lives?",
            Choice("Against your better judgement, you head to the old gingerbrad house.", 13),
            Choice("You can't risk it. You find your own way.", 14)),
        7: AdventureNode("You guess a pencil lead. The wolf laughs and says, 'Nope, not quite.' He grabs you and throws you into the river. You float downstream until you reach the shore... and find yourself back at the beginning of the Enchanted Forest.",
            Choice("You try again.", 1),
            Choice("You give up", 0)),
        8: AdventureNode("You guess a match. The wolf is confused by your answer. During his state of confusion, you run right past him! You see Grandma's house in the distance. You keep going, faster and faster, until you make it to Grandma's house right on time for supper.",
            Choice("", 0),
            Choice("", 0)),
        9: AdventureNode("You guess seven (remove the 's' and it becomes 'even'). The wolf laughs heartily and says, 'You are indeed clever!' He lets go of you and runs away into the woods. You keep walking until you eventually reach Grandma's house!",
            Choice("", 0),
            Choice("", 0)),
        10: AdventureNode("You guess eleven (remove the 'e' and 'l' and it becomes 'even'). The wolf laughs and asks, 'Did you even try?' He grabs you and runs off. As he runs, he trips over a large, fallen branch. You take this opportunity to run.",
            Choice("You run east.", 15),
            Choice("You run west.", 16)),
        11: AdventureNode("You crawl through the hollow tree, only to realize it's a trap and you cannot escape. You are trapped inside and never make it to Grandma's house!",
            Choice("", 0),
            Choice("", 0)),
        12: AdventureNode("You decide to find your own way. You wonder deeper into the woods and find a trail of breadcrumbs. Huh? Who left those? Suddenly, two kids, Hansel and Gretel, pop out from behind a bush. 'Are you lost', they ask.",
            Choice("You decide to ask them for help finding Grandma's house.", 17),
            Choice("You don't quite trust them. You keep going alone.", 18)),
        13: AdventureNode("The sweet smell of cookies fill the air as you reach the Gingerbread House. A kind-looking lady opens the door. 'Lost dear? Come inside and rest', she says with a smile.",
            Choice("Go inside and play along", 19),
            Choice("Make an excuse and leave quickly.", 20)),
        14: AdventureNode("You take a long detour through the Enchanted Forest. The trees whisper, and shadows move. Suddenly, you hear a familiar voice calling your name. 'Grandma! Grandma!'",
            Choice("", 0),
            Choice("", 0)),
        15: AdventureNode("You run east, but the woods seem to go on forever. Maybe you made a wrong turn somewhere? None of this looks familiar to you. You are lost.",
            Choice("", 0),
            Choice("", 0)),
        16: AdventureNode("You run west. You are starting to feel hopeless when suddenly you smell the sweet scent of Grandma's cherry pie. As you get closer and closer, the smell grows stronger. Finally! You make it to Grandma's house!",
            Choice("", 0),
            Choice("", 0)),
        17: AdventureNode("Turns out, they're really good at navigating the forest. They lead you straight to Grandma's house, and you make it there safely!",
            Choice("", 0),
            Choice("", 0)),
        18: AdventureNode("You have no idea where you're going. The sun is starting to set. You decide to follow the path back to go home. You'll try to find Grandma's house tomorrow.",
            Choice("", 0),
            Choice("", 0)),
        19: AdventureNode("The lady really is a witch! But its too late and there is no way to leave. 'I guess you won't be making it to Grandma's house after all.', she says with a cackle.",
            Choice("", 0),
            Choice("", 0)),
        20: AdventureNode("Smart move! You continue towards Grandma's house, but you sense someone is watching you... Luckily, you make it there safely!",
            Choice("", 0),
            Choice("", 0))
    ]
    
    func getImageName() -> Int {
        return nodeIndex
    }
    
    func getNode() -> AdventureNode {
        return nodes[nodeIndex]!
    }
    
    func getChoiceOne() -> Choice {
        return nodes[nodeIndex]!.choiceOne
    }
    
    func getChoiceTwo() -> Choice {
        return nodes[nodeIndex]!.choiceTwo
    }
}


struct AdventureNode {
    
    init(_ txt: String, _ ch_one: Choice, _ ch_two: Choice) {
        text = txt
        choiceOne = ch_one
        choiceTwo = ch_two
    }
    
    var text: String
    var choiceOne: Choice
    var choiceTwo: Choice
}

struct Choice {
    
    init(_ txt: String, _ next: Int) {
        text = txt
        nextNode = next
    }
    
    var text: String
    var nextNode : Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    



}

