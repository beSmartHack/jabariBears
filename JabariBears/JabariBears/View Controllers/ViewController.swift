//
//  ViewController.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    let inSpeech = SpeechInput()
    let speechRecognition = SpeechOutput()
    
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchTextInput: UITextField!
    @IBAction func onSearchSubmit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let introText = "Welcome there, do you want the smart assistant feature on or off?"
        speechRecognition.say(text: introText)
        
        
        
        
    }

    @IBAction func didTapScreen(_ sender: Any) {
        self.inSpeech.recordButtonTapped()
    }
    
}

