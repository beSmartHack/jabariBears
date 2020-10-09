//
//  ViewController.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let introText = "Welcome there, do you want the smart assistant feature on or off?"
        let speechRecognition = SpeechOutput()
        speechRecognition.say(text: introText)
    }


}

