//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Davis Rixi on 2/12/16.
//  Copyright © 2016 Davis Rixi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordingStop: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    
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

    }

    @IBAction func stopRecord(sender: UIButton) {
        recordingInProgress.hidden = true
        recordingStop.hidden = true

        
    }
    
    override func viewWillAppear(animated: Bool) {
        recordButton.enabled = true
    }
}

