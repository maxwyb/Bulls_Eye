//
//  ViewController.swift
//  BullsEye
//
//  Created by Yingbo Wang on 7/23/15.
//  Copyright (c) 2015 Yingbo Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var score = 0;
    var round = 0;
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        /*
        currentValue = lroundf(slider.value)
        var targetValue: Int = 0;
        targetValue = 1 + Int(arc4random_uniform(100))
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        var difference = currentValue - targetValue
        if difference < 0 {
            difference *= -1
        }
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost did it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "The value of the slider is: \(currentValue)"
                    + "\nThe target value is: \(targetValue)"
                    + "\nThe difference is: \(difference)"
                    + "\nYou get \(points) points."
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Cool", style: .Default,
                                   handler: { action in
                                                self.startNewRound()
                                                self.updateLabels()
                                            })
        
        /*
        let action2 = UIAlertAction(title: "OK, Bye", style: .Default,
            handler: nil)
        */
        
        alert.addAction(action)
        // alert.addAction(action2)
        
        presentViewController(alert, animated: true, completion: nil)
        
        /*
        startNewRound()
        updateLabels()
        */
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        
        currentValue = lroundf(slider.value)
        // println("The value of the slider is changed to: \(currentValue)")
        
    }
    
    @IBAction func startOver() {
        
        round = 0
        score = 0
        
        startNewRound();
        updateLabels();
        
    }
    
    func startNewRound() {
        
        round += 1;
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
}

