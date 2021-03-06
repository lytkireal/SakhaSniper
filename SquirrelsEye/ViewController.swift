//
//  ViewController.swift
//  SquirrelsEye
//
//  Created by macbook air on 07.02.17.
//  Copyright © 2017 macbook air. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
  var currentValue = 50
  var targetValue = 0
  var score = 0
  var round = 0

    
    
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  func startNewRound() {
    // set up a new round
    targetValue = 1 + Int(arc4random_uniform(100))
    round += 1
  }
  
  func startNewGame() {
    self.score = 0
    self.round = 0
    slider.value = 50
    self.startNewRound()
  }
  
  func updateLabels() {
        
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
    
  override func viewDidLoad() {
    /*
    This is a good place to set instance variables to their proper initial values
    Do any additional setup after loading the view, typically from a nib.
    */
    super.viewDidLoad()
    self.startNewGame()
    self.updateLabels()
    // settings of slider(we can not setting up in storyboard)
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighLighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighLighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable =
                        trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable =
                          trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func showAlert() {
    /*
    The commands between the { } brackets tell the iPhone what to do,
    and they are performed from top to bottom
    */
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    // setting up our messages by points
    let title: String
    if difference == 0{
      title = "Perfect!"+"\nYou've got 100 bonus points!"
      points += 100
    }else if difference < 5 {
      title = "You almost had it!"+"\nYou've got 50 bonus points!"
      if difference == 1 {
      points += 50
      }
    }else if difference < 10 {
      title = "Pretty good!"
    }else {
      title = "Not even close..."
    }
    score += points
    let message = "you scored \(points) points"
    let _alert = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: {action in    // event handler
                                self.startNewRound()
                                self.updateLabels()
                                })
        
    _alert.addAction(action)
        
    present(_alert, animated: true, completion: nil)

    }
    
  @IBAction func sliderMoved(_ slider:UISlider){
    currentValue = lroundf(slider.value) //round-off slider's value to integer
  }
  
  @IBAction func startOver() {
  //restart the game
    
    startNewGame()
    updateLabels()
    
    let transition = CATransition()
    transition.type = kCATransitionFade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    view.layer.add(transition, forKey: nil)
    
  }


}

