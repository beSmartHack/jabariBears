//
//  ViewController.swift
//  JabariBears
//
//  Created by Subomi Popoola on 10/9/20.
//

import UIKit
import AVFoundation
import SpeechKitManager
import Speech

class ViewController: UIViewController, AVSpeechSynthesizerDelegate, SFSpeechRecognizerDelegate {
    
    let speechRecognition = SpeechInput()
    let synthesizer = AVSpeechSynthesizer()
    var machineText = String()
    var humanText = String()
    var isSmart = false
    var city = [String:String]()
    
    var speechKitManager:SpeechKitManager?
    
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchTextInput: UITextField!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    
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
        synthesizer.delegate = self
        
        print("luck")
        //appStart()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Configure the SFSpeechRecognizer object already
        // stored in a local member variable.
        speechRecognizer.delegate = self
        
        // Asynchronously make the authorization request.
        SFSpeechRecognizer.requestAuthorization { authStatus in

            // Divert to the app's main thread so that the UI
            // can be updated.
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    print("authorized")
                case .denied:
                    print("denied")
                case .restricted:
                    print("restricted")
                case .notDetermined:
                    print("not determined")
                default:
                    print("default")
                }
            }
        }
    }
    
    private func startRecording() throws {
        
        // Cancel the previous task if it's running.
        recognitionTask?.cancel()
        self.recognitionTask = nil
        
        // Configure the audio session for the app.
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        let inputNode = audioEngine.inputNode

        // Create and configure the speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
        
        // Keep speech recognition data on device
        if #available(iOS 13, *) {
            recognitionRequest.requiresOnDeviceRecognition = false
        }
        
        // Create a recognition task for the speech recognition session.
        // Keep a reference to the task so that it can be canceled.
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            
            if let result = result {
                // Update the text view with the results
                isFinal = result.isFinal
                print("Text \(result.bestTranscription.formattedString)")
                self.humanText = result.bestTranscription.formattedString
            }
            
            if error != nil || isFinal {
                // Stop recognizing speech if there is a problem.
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.recognitionRequest = nil
                self.recognitionTask = nil

            }
        }

        // Configure the microphone input.
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
   
    }
    
    // MARK: Interface Builder actions
    
    func recordButtonTapped() {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
        } else {
            do {
                try startRecording()
            } catch {
               print("error")
            }
        }
    }
    
    func appStart(){
        machineText = "Welcome there, do you want the smart assistant feature on or off?"
        say(text: machineText)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("me")
        isSmart = true
        print("yes")
    }
    
    func say(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-ZA")
        utterance.rate = 0.545

        synthesizer.speak(utterance)
    }
    
    func preProcess(text: String){
        city = self.city_data[text]!
        self.performSegue(withIdentifier: "cityDetails", sender: self)
    }
    
    @IBAction func onSearchSubmit(_ sender: Any) {
        self.performSegue(withIdentifier: "cityDetails", sender: self)
    }
    

    @IBAction func didTapScreen(_ sender: Any) {
        if isSmart{
            recordButtonTapped()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        var cityViewController = segue.destination as! CityViewController
        
    }
    
}

