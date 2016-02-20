//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Davis Rixi on 2/19/16.
//  Copyright © 2016 Davis Rixi. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = try!
                AVAudioPlayer(contentsOfURL: filePathURL)
            audioPlayer.enableRate = true
        
        
        }else{
            print("the filePath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowAudio(sender: UIButton) {
        // Play audio sloooooowly here
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }


}
