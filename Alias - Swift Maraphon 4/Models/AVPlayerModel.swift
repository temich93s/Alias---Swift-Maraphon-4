//
//  AVPlayerModel.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit
import AVFoundation

struct AVPlayerModel {
    // Здесь надо написать 2 метода каждый из которых будет возвращать звук, первый звук при пропуске слова, второй при правильном ответе
    
    static var player: AVAudioPlayer!
    
    static func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
