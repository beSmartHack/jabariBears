//
//  SpeechInput.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit
import Speech
import SpeechKitManager

class SpeechInput: UIViewController {
    
   
    var speechKitManager:SpeechKitManager?
    
    // MARK: View Controller Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func authorizeMicAccess(){
        speechKitManager?.requestMicAuth({ (granted) in
            print("me")
            if granted{
            //Mic access granted start recognition
            self.recognize()
            }else{
                debugPrint("Microphone permission required")
            }
        })
    }
    
    func recognize(){
        print("me1")
        speechKitManager?.record(resultHandler: { (result, error) in
            var isFinal = false
            print("me2")
            if let result = result {
                //User speech will fall here to text
                print("me3")
                debugPrint(result.bestTranscription.formattedString)
                print(result.bestTranscription.formattedString)
                isFinal = result.isFinal
            }
            print("me4")
            if error != nil || isFinal {
                print("me5")
                self.speechKitManager?.stop()
            }
        })
    }
   
}
