//
//  JokeModel.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import Foundation

struct JokeModel {
    // Здесь нужно написать метод который будет делать запрос шутки с сайта, получать ее, парсить ее и сохранять ее в GameModel.jokeText (свойство типа)
    
    // Предлаю все же сделать русскую шутку (так как весь интерфейс на русском), а не английскую, русскую шутку можно получить тут: http://www.rzhunemogu.ru/FAQ.aspx. Пример запроса: http://rzhunemogu.ru/RandJSON.aspx?CType=1
    // У этого русского сайта с шутками, есть проблема заключается она в том, что по правилам все JSON файлы идут в кодировке UTF-8, но этот сайт особенный, он присылает ее в кодировке Windows-1251. Поэтому JSONDecoder распарсить ее не сможет (возможно есть какой-то особенный метод, который умеет работать с кодировкой Windows-1251, но я особо не разбирался). По итогу тут после получения данных с сайта надо данные просто конвертировать в переменную типа String, там есть у него метод который может конвертировать data типа Windows-1251 в String, а потом лишние символы обрезать просто
    
    let jokeURL = "http://rzhunemogu.ru/RandJSON.aspx?CType=1"
    
    func fetchJoke() {
        performRequest(jokeURL: jokeURL)
    }
    
    func performRequest(jokeURL: String) {
        
        if let url = URL(string: jokeURL) {
            
            let session = URLSession(configuration:  .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
                
            task.resume()
        }
    }

    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .windowsCP1251)
            print(dataString)
        }
    }
    
        func parseJSON(jokeData: Data) {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(JokeData.self, from: jokeData)
                print(decodedData.content)
            } catch {
                print(error)
            }
        }
}
