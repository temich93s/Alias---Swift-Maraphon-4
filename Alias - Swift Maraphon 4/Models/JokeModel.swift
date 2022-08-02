//
//  JokeModel.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import Foundation

// Структура у которой есть метод получения шутки с сайта rzhunemogu.ru и записи ее в переменную GameModel.jokeText
struct JokeModel {
    
    static func fetchJoke() {
        if let url = URL(string: "http://rzhunemogu.ru/RandJSON.aspx?CType=1") {
            let session = URLSession(configuration:  .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err.localizedDescription)
                }
                if let safeData = data {
                    if let safeJoke = String(data: safeData, encoding: .windowsCP1251) {
                        var currentJoke = safeJoke
                        var rangeToCut = currentJoke.startIndex..<currentJoke.index(currentJoke.startIndex, offsetBy: 12)
                        currentJoke.removeSubrange(rangeToCut)
                        rangeToCut = currentJoke.index(currentJoke.endIndex, offsetBy: -2)..<currentJoke.endIndex
                        currentJoke.removeSubrange(rangeToCut)
                        GameModel.jokeText = currentJoke
                    }
                }
            }
            task.resume()
        }
    }    
}
