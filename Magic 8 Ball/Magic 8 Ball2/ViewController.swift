//
//  ViewController.swift
//  Magic 8 Ball2
//
//  Created by Victor Mac on 7/15/19.
//  Copyright © 2019 Victor Lisnytskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ballArray = [String]()
    var randomNumber = 0
    var previousRandomNumber = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
        print(randomNumber)
    }
    
    func newBallImage() {
        randomNumber = Int.random(in: 0 ... 9)
        
        //I put this while here to make sure that ball won't show the same reply 2 times in a row, as I noticed that Int.random likes to do it pretty often
        while previousRandomNumber == randomNumber {
            randomNumber = Int.random(in: 0 ... 9)
        }
        
        imageView.image = UIImage(named: ballArray[randomNumber])
        previousRandomNumber = randomNumber
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        for x in 1...10 {
            ballArray.append("ball\(x)")
        }
        
        imageView.image = UIImage(named: "8")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

}

