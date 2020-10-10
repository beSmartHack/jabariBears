//
//  SpeechOutput.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit
import OSSSpeechKit

class SpeechOutput: NSObject {
    func say(text: String){
        // Declare an instance of OSSSpeechKit
        let speechKit = OSSSpeech.shared
        // Set the voice you wish to use - currently upper case for formality or language and country name
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Australian)
        // Set the text in the language you have set
        speechKit.speakText(text)
    }
}
