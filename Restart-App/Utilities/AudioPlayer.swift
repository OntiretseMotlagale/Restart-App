//
//  AudioPlayer.swift
//  Restart-App
//
//  Created by Ontiretse Motlagale on 2022/11/24.
//

import Foundation
import AVFoundation

var audio: AVAudioPlayer?

func playSound(sound: String, type: String ){
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL (fileURLWithPath: path))
            audio?.play()
        }catch {
            print("Could not find the song file")
        }
    }
}
