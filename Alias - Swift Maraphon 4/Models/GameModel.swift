//
//  GameModel.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import Foundation
import UIKit



// общая структура со свойствами типа, что бы у всех ViewController был доступ к общим данным
struct GameModel {
    
    static var wordSets = [
        // наборы слов временные мы их поменяем
        ["Тигр", "Лев", "Кролик", "Лиса", "Жираф", "Енот", "Хомяк", "Коза", "Косатка", "Дельфин"],
        ["Береза", "Дуб", "Клен", "Сосна", "Земляника", "Одуванчик", "Крапива", "Черешня", "Роза", "Ива"],
        ["Индия", "Германия", "Франция", "Аргентина", "Сингапур", "Канада", "Бразилия", "Кения", "Египет", "Грузия"],
        ["Самолет", "Автобус", "Троллейбус", "Самосвал", "Яхта", "Воздушный шар", "Авианосец", "Трамвай", "Фуникулер", "Электросамокат"]
    ]
    static var nameTeamNumber1 = "Команда № 1"
    static var nameTeamNumber2 = "Команда № 2"
    static var currentTheme = wordSets[0]
    static var pointsTeamNumber1 = 0
    static var pointsTeamNumber2 = 0
    static var jokeText = "Здесь должна была быть шутка, но что-то пошло не так 😭"
    
    static var roundTime = 60
    
    
}
