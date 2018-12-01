//
//  ViewController.swift
//  bahriaRadioApp
//
//  Created by Marij on 28/11/2018.
//  Copyright © 2018 Marij. All rights reserved.
//

import UIKit
import AVFoundation
import FRadioPlayer

class ViewController: UIViewController, AVAudioPlayerDelegate, FRadioPlayerDelegate {
    let player = FRadioPlayer.shared

    @IBOutlet weak var playButton: UIButton!
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        if(player.isPlaying) {
            playButton.setImage(UIImage(named: "blue-pause-button")!, for: .normal)
        }
        print("Yeah it really changed")
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
        print("Yo it changed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.delegate = self
        player.radioURL = URL(string: "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p")
    
    }
    @IBAction func touchPlay(_ sender: UIButton) {
        player.togglePlaying()
        if(player.isPlaying) {
            playButton.setImage(UIImage(named: "blue-pause-button")!, for: .normal)
        }
        else {
            playButton.setImage(UIImage(named: "blue-play-button")!, for: .normal)
        }
    }
    
}

