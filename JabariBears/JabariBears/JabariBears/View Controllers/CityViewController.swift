//
//  CityViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit
import AVFoundation
import SpeechKitManager
import Speech


class CityViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    var isSmart: Bool!
    var cityData: [String:String]!
    let speechRecognition = SpeechInput()
    let synthesizer = AVSpeechSynthesizer()
    var machineText = String()
    var humanText = String()
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateView()
        sayTexts()
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
                print(humanText + "!!!!!")
               
                recognitionRequest?.endAudio()
            } else {
                do {
                    try startRecording()
                } catch {
                   print("error")
                }
            }
    }
    
    func populateView() {
        self.cityName.text = self.cityData["name"]!
        let image = UIImage(named: self.cityData["image"]!)
        self.cityImage.image = image
        self.cityDescription.text = self.cityData["description"]
    }
    
    func say(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-ZA")
        utterance.rate = 0.545

        synthesizer.speak(utterance)
    }
    
    func sayTexts(){
        say(text: self.cityData["name"]!)
        say(text: self.cityData["description"]!)
        say(text: "Say 1 to search hotels")
        say(text: "Say 2 to seach activities")
        say(text: "say 3 to seatch flights")
    }
    
    @IBAction func didTapScreen(_ sender: Any) {
    }
    @IBAction func goToActivites(_ sender: Any) {
    }
    @IBAction func goToHotels(_ sender: Any) {
    }
    @IBAction func goToFlights(_ sender: Any) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
