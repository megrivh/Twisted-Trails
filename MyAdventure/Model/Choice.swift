//
//  Choice.swift
//  MyAdventure
//
//  Created by Megan Rivera Hammock on 2/14/25.
//
import Foundation

// Struct representing a choice in the adventure story
struct Choice {
    
    // Initializer to create a Choice object with the choice text and index of next node if choice is selected
    init(_ txt: String, _ next: Int) {
        text = txt
        nextNode = next
    }
    
    var text: String
    var nextNode : Int
    
    // Function returns the index of next node in the story
    func getNextNodeIndex() -> Int {
        return nextNode
    }
    
    // Function returns the text of the choice
    func getChoiceText() -> String {
        return text
    }
}
