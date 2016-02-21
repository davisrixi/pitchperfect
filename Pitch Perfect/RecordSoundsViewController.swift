//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Davis Rixi on 2/12/16.
//  Copyright © 2016 Davis Rixi. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {//Step 1 - Adding delegate

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordingStop: UIButton!
    @IBOutlet weak var recordButton: UIButton!

    //Declared Globally
    var audioRecorder:AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordingStop.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        //Show some text "Recording in progress"
        recordingInProgress.hidden = false
        //Show stop button
        recordingStop.hidden = false
        //Record the user's voice
        //print("in recordAudio")
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.delegate = self //Step 2 - Adding delegate
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        

    }

    @IBAction func stopRecord(sender: UIButton) {
        recordingInProgress.hidden = true
        recordingStop.hidden = true

        //Inside func stopAudio(sender: UIButton)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func viewWillAppear(animated: Bool) {
        recordButton.enabled = true
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
        //Save the recorded Audio
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        //move to the next escene aka perform segue
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
            print("Recording was successful")

        }else{
            print("Recording was not successful")
            recordButton.enabled = true
            recordingStop.enabled = false
        }
        
    }
}

