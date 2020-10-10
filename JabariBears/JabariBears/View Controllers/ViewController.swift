//
//  ViewController.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    let speechRecognition = SpeechOutput()
    let synthesizer = AVSpeechSynthesizer()
    var machineText = String()
    var humanText = String()
    
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchTextInput: UITextField!
    
    let city_data = [
        "Fort Worth": [
                    "name": "Fort Worth",
                    "image": "ForthWorth",
                    "description": "Fort Worth is the second-largest city in the Dallas. Fort Worth metropolitan area is the fourth-most populous metropolitan area in the United States"],
        "Los Angeles": [
                    "name": "Los Angeles",
                    "image": "LosAngeles",
                    "description": "The city of Los Angeles [69] (also known simply as L.A. and nicknamed the 'City of Angels') is the most populous city in California. Located on a broad basin in Southern California. the city is surrounded by vast mountain ranges"],
        "Baltimore": [
                    "name": "Baltimore",
                    "image": "Baltimore",
                    "description": "Baltimore is the largest city in Maryland and the center of a metropolitan area of 1.5 million people"]
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        machineText = "Welcome there, do you want the smart assistant feature on or off?"
    }
    
    func appStart(){
        
    }
    
    func say(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-ZA")
        utterance.rate = 0.545

        synthesizer.speak(utterance)
    }
    
    
    
    @IBAction func onSearchSubmit(_ sender: Any) {
        self.performSegue(withIdentifier: "cityDetails", sender: self)
    }
    

    @IBAction func didTapScreen(_ sender: Any) {
        
    }
    
}

