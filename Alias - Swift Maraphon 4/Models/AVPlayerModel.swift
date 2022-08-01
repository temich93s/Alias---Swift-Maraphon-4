//
//  AVPlayerModel.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit
import AVFoundation

// плеер у которого есть метод воспроизводящий звук, по заданному имени файла
struct AVPlayerModel {
    
    static var player: AVAudioPlayer!
    
    static func playSound(sound: String) {
        if let url = Bundle.main.url(forResource: sound, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
