//
//  ViewController.swift
//  ikid
//
//  Created by Kyle Wistrand on 10/27/18.
//  Copyright © 2018 Kyle Wistrand. All rights reserved.
//

import UIKit

class Jokes {
    let good = ["Q: Why did the poor man sell yeast?", "A: To raise some dough", "Q: What do you call anxious dinosaurs?", "A: Nervous Rex."]
    let punny = ["Q: What did the volcano say to his husband?", "A: I lava you", "Q: How do you organize a space party?", "A: You planet"]
    let long = ["Knock, knock!", "Who’s there?", "Abe.", "Abe who?", "Abe CDEFJH…", "Knock, knock!", "Who’s there?", "Wire.", "Wire who?", "Wire you always asking ‘who’s there’?"]
}

class ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var jokeKindSelector: UITabBar!
    @IBOutlet weak var JokeLabel: UILabel!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    var jokeSet : [String] = ["Welcome! Select a category:"]
    var currentStep : Int = 0
    
    public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedTab = item.tag
        switch selectedTab {
        case 1:
            self.jokeSet = Jokes().good
            break
        case 2:
            self.jokeSet = Jokes().punny
            break
        case 3:
            self.jokeSet = Jokes().long
            break
        default:
            assert(false, "Should never get tag number \(selectedTab)")
        }
        
        nextButtonOutlet.isHidden = false
        currentStep = 0
        JokeLabel.text = jokeSet[currentStep]
    }
    
    @IBAction func nextButton(_ sender: Any) {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        
        if currentStep >= jokeSet.count - 1 {
            currentStep = 0
        } else {
            currentStep += 1
        }
        
        JokeLabel.text = jokeSet[currentStep]
        
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jokeKindSelector.delegate = self
    }

}

