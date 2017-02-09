//
//  ViewController.swift
//  SquirrelsEye
//
//  Created by macbook air on 07.02.17.
//  Copyright © 2017 macbook air. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var currentValue: Int = 50
    
  var targetValue: Int = 0
    

    
    
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
    
  func startNewRound() {
    // set up a new round
        
    //currentValue = 50
    targetValue = 1 + Int(arc4random_uniform(100))
    //slider.value = Float(currentValue)
  }
    
  func updateLabels() {
        
    targetLabel.text = String(targetValue)
  }
    
  override func viewDidLoad() {
    /*
    This is a good place to set instance variables to their proper initial values
    Do any additional setup after loading the view, typically from a nib.
    */
    super.viewDidLoad()
    self.startNewRound()
    self.updateLabels()
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
    let message = "The value of the slider is: \(currentValue)" +
                  "\nThe tartget value is: \(targetValue)" +
                  "\nThe difference is: \(difference)"
        
    let _alert = UIAlertController(title: "Hello iOS!",
                                   message: message,     //changed
                                   preferredStyle: .alert)
        
    let action = UIAlertAction(title: "OK",             //changed
                               style: .default,
                               handler: nil)
        
    _alert.addAction(action)
        
    present(_alert, animated: true, completion: nil)
        
    self.startNewRound()
    self.updateLabels()
    }
    
  @IBAction func sliderMoved(_ slider:UISlider){
    currentValue = lroundf(slider.value) //round-off slider's value to integer
  }


}

