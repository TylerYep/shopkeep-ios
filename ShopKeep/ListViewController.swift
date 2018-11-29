//
//  ListViewController.swift
//  ShopKeep
//
//  Created by Alex Fu on 11/18/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit
import Speech

class ListViewController: UIViewController,
                          UITableViewDelegate, UITableViewDataSource,
                          SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var penButton: UIButton!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var debugLabel: UILabel!
    
    let audioEngine = AVAudioEngine()
    // let recognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    override func viewDidLoad() {
        
        self.requestSpeechAuthorization()
        
        // border
        itemView.layer.borderWidth = 1.0
        itemView.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        itemView.layer.shadowColor = UIColor.black.cgColor
        itemView.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemView.layer.shadowOpacity = 0.7
        itemView.layer.shadowRadius = 4.0
        
        penButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        micButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TODO
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        cell.selectionStyle = .none
        cell.configure(text: "", placeholder: "")
        return cell
    }
    
    @IBAction func penButtonPressed(_ sender: Any) {
        print("pen button pressed")
    }
    
    @IBAction func micButtonPressed(_ sender: Any) {
        print("mic button pressed")
        // self.recordAndRecognizeSpeech()
    }
    
    func recordAndRecognizeSpeech() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {buffer, _ in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("There has been an audio engine error.")
            return
        }
        guard let recognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US")) else {
            print("Speech recognition is not supported for your current locale.")
            return
        }
        if !(recognizer.isAvailable) {
            print("Speech recognition is not currently available. Check back at a later time.")
            // Recognizer is not available right now
            return
        }
        recognitionTask = recognizer.recognitionTask(with: request, resultHandler: { result, error in
            if let result = result {
                
                let bestString = result.bestTranscription.formattedString
                print("DEBUG: " + bestString)
                
                var lastString: String = ""
                for segment in result.bestTranscription.segments {
                    let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                    // lastString = bestString.substring(from: indexTo)
                    lastString = String(bestString[indexTo...])
                }
                print("DEBUG: " + lastString)
                self.debugLabel.text = lastString
            } else if let error = error {
                print("There has been a speech recognition error.")
                print(error)
            }
        })
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    print("Speech authorized")
                case .denied:
                    print("User denied access to speech recognition")
                case .restricted:
                    print("Speech recognition restricted on this device")
                case .notDetermined:
                    print("Speech recognition not yet authorized")
                }
            }
        }
    }
}
