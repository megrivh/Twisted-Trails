//
//  ViewController.swift
//  MyAdventure
//
//  Created by Megan Rivera Hammock on 2/13/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    
    var adventureLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // Action triggered when user selects the first choice
    @IBAction func choiceOneSelected(_ sender: UIButton) {
        // Get current node in the story
        let currentNode = adventureLogic.getCurrentNode()
        
        // Change button background color to reflect choice selection
        choiceOneButton.backgroundColor = UIColor.lightGray
        
        // Get next story prompt based on next node index from selected choice
        adventureLogic.nodeIndex = currentNode?.choiceOne.getNextNodeIndex() ?? 0
        
        // After 0.5 seconds, update UI to show next story prompt
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // Action triggered when user selects the second choice
    @IBAction func choiceTwoSelected(_ sender: UIButton) {
        // Get current node in the story
        let currentNode = adventureLogic.getCurrentNode()
        
        // Change button background color to reflect choice selection
        choiceTwoButton.backgroundColor = UIColor.lightGray
        
        // Get next story prompt based on next node index from selected choice
        adventureLogic.nodeIndex = currentNode?.choiceTwo.getNextNodeIndex() ?? 0
        
        // After 0.5 seconds, update UI to show next story prompt
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // Function called to update UI whenever the story progresses
    @objc func updateUI() {
        // Get current story node
        let currentNode = adventureLogic.getCurrentNode()
        
        // Show story text
        storyLabel.text = adventureLogic.getStoryPrompt()
        
        // Change background image based on story node index
        background.image = UIImage(named: String(adventureLogic.nodeIndex))
        
        // Update buttons with choice options
        if let choiceOne = currentNode?.choiceOne {
            choiceOneButton.setTitle(choiceOne.text, for: .normal)
        }
        
        if let choiceTwo = currentNode?.choiceTwo {
            choiceTwoButton.setTitle(choiceTwo.text, for: .normal)
        }
        
        // Set button background back to clear indicating unanswered prompt
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        
        // Update button appearance based on button text content
        if let choiceOneText = currentNode?.choiceOne.getChoiceText(), choiceOneText.isEmpty {
            choiceOneButton.layer.borderWidth = 0
            choiceOneButton.layer.borderColor = UIColor.clear.cgColor
            choiceOneButton.isEnabled = false
        } else {
            choiceOneButton.layer.borderWidth = 4
            choiceOneButton.layer.borderColor = UIColor.black.cgColor
            choiceOneButton.isEnabled = true
        }
        
        if let choiceTwoText = currentNode?.choiceTwo.getChoiceText(), choiceTwoText.isEmpty {
            choiceTwoButton.layer.borderWidth = 0
            choiceTwoButton.layer.borderColor = UIColor.clear.cgColor
            choiceTwoButton.isEnabled = false
        } else {
            choiceTwoButton.layer.borderWidth = 4
            choiceTwoButton.layer.borderColor = UIColor.black.cgColor
            choiceTwoButton.isEnabled = true
        }
    }
    
}

