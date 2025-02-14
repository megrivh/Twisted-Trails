//
//  AdventureNode.swift
//  MyAdventure
//
//  Created by Megan Rivera Hammock on 2/14/25.
//
import Foundation

// Struct representing a single node in the adventure story
struct AdventureNode {
    
    // Initializer to create an AdventureNode object with the story text and two choices
    init(_ txt: String, _ ch_one: Choice, _ ch_two: Choice) {
        text = txt
        choiceOne = ch_one
        choiceTwo = ch_two
    }
    
    var text: String
    var choiceOne: Choice
    var choiceTwo: Choice
}
