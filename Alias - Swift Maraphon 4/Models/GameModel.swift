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
        // Млекопитающие
        ["Жираф", "Пищуха", "Заяц", "Кролик", "Бобр",
         "Мышь", "Тушканчик", "Слепышь", "Хомяк", "Леминг",
         "Крыса", "Белка", "Суслик", "Соня", "Еж",
         "Крот", "Летучая мышь", "Нетопырь", "Кит", "Кашалот",
         "Дельфин", "Морская свинка", "Нарвал", "Белуха", "Олень",
         "Лось", "Бизон", "Овцебык", "Баран", "Козел",
         "Кабан", "Лошадь", "Кот", "Рысь", "Тигр",
         "Леопард", "Каракал", "Гиена", "Сабака", "Волк",
         "Лиса", "Песец", "Медведь", "Сивуч", "Морж",
         "Нерпа", "Тюлень", "Соболь", "Ласка", "Норка",
         "Росомаха", "Барсук", "Выдра", "Енот", "Лань",
         "Косатка", "Дикобраз", "Бурундук", "Лев", "Зебра"],
        // IT
        ["Принимать", "Доступ", "Профиль", "Адаптер", "Добавить",
         "Интернет-адрес", "Команда", "Антивирусные программы", "Приложение", "Кэш",
         "Бит", "Технология беспроводного обмена данными", "Запуск", "Байт", "Браузер",
         "Буфер", "Баг", "Неполадка", "Загрузочный диск", "Резервное копирование",
         "Компакт-диск", "Чистить", "Кликнуть", "Закрыть", "Объём данных",
         "Копировать", "Центральный процессор", "Вырезать", "Данные", "База данных",
         "Отлаживать", "Настройки по умолчанию", "Удалять", "Рабочий стол", "Цифровой",
         "Директория", "Дисковод", "Дисплей", "Скачать", "Драйвер",
         "Электронная почта", "Редактировать", "Файл", "Найти", "Флеш-карта памяти",
         "Дискета", "Дисковод гибких дисков", "Папка", "Шрифт", "Форматировать",
         "Гигабайт", "Видеокарта", "Взломать", "Жёсткий диск", "Точка доступа",
         "Иконка", "Интернет", "Клавиатура", "Цикл", "Материнская плата"],
        // Страны
        ["Индия", "Китай", "США", "Индонезия", "Пакистан",
         "Бразилия", "Нигерия", "Бангладеш", "Россия", "Мексика",
         "Япония", "Эфиопия", "Филиппины", "Египет", "Австралия",
         "Вьетнам", "Иран", "Турция", "Германия", "Таиланд",
         "Франция", "Великобритания", "Танзания", "Швейцария", "Италия",
         "Кения", "Мьянма", "Республика Корея", "Колумбия", "Уганда",
         "Испания", "Судан", "Алжир", "Аргентина", "Ирак",
         "Украина", "Афганистан", "Канада", "Польша", "Марокко",
         "Узбекистан", "Саудовская Аравия", "Ангола", "Малайзия", "Венесуэла",
         "Перу", "КНДР", "Чили", "Казахстан", "Нидерланды",
         "Сомали", "Куба", "Греция", "Чехия", "Португалия",
         "Азербайджан", "Израиль", "Новая Зеландия", "Финляндия", "Исландия"],
        // Черты характера
        ["Забывчивый", "Активный", "Агрессивный", "Злой", "Высокомерный",
         "Странный", "Грубоватый", "Занятой", "Спокойный", "Беззаботный",
         "Заботливый", "Осторожный", "Очаровательный", "Харизматичный", "Неунывающий",
         "Неуклюжий", "Ребячливый", "Хладнокровный", "Сострадательный", "Уверенный",
         "Храбрый", "Ярусливый", "Сумасшедший", "Креативный", "Жестокий",
         "Хитрый", "Кюбопытный", "Циничный", "Деликатный", "Тщеславный",
         "Патриотичный", "Независимый", "Глупый", "Мягкий", "Щедрый",
         "Предвзятый", "Нетерпеливый", "Верный", "Жадный", "Честный",
         "Рациональный", "Романтичный", "Честный", "Решительный", "Оптимистичный",
         "Невежественный", "Отвратительный", "Угрюмый", "Преданный", "Скучный",
         "Застенчивый", "Мудрый", "Эмоциональный", "Эгоцентрик", "Серьёзный",
         "Юморной", "Необычный", "Ленивый", "Мрачный", "Дружелюбный"],
    ]
    
    static var currentGame = 1
    static var currentRound = 1
    static var nameTeamNumber1 = "Команда 1"
    static var nameTeamNumber2 = "Команда 2"
    static var currentTeam = nameTeamNumber1
    static var currentTheme = wordSets[0]
    static var pointsTeamNumber1 = 0
    static var pointsTeamNumber2 = 0
    static var jokeText = "Здесь должна была быть шутка, но что-то пошло не так 😭"
    static var pointsCurrentMove = 0
    
    //Длина раунда
    static var lengthWholeRound = 60
    static var lengthCurrentRound = lengthWholeRound
    static var wordNumber = 0

    // добавляем 1 очко за правильный ответ
    static func pointPlus() {
        switch currentTeam {
        case nameTeamNumber1: pointsTeamNumber1 += 1
        case nameTeamNumber2: pointsTeamNumber2 += 1
        default: break
        }
    }
    
    // отнимаем 1 очко за правильный ответ
    static func pointMinus() {
        switch currentTeam {
        case nameTeamNumber1: pointsTeamNumber1 -= 1
        case nameTeamNumber2: pointsTeamNumber2 -= 1
        default: break
        }
    }
    
    // устанавливаем команду, которая играет текущий ход
    static func whatCurrentTeam(round: Int) {
        if round % 2 == 1 {
            currentTeam = nameTeamNumber1
        } else {
            currentTeam = nameTeamNumber2
        }
    }
    
    // устанавливаем текущий раунд
    static func changeCurrentRound() {
        if currentGame % 2 != 0 {
            currentRound += 1
        }
    }
    
    // утстанавливаем следующее слово
    static func wordNumberChange() {
        if wordNumber < 7 {
            wordNumber += 1
        } else {
            wordNumber = 0
        }
    }
    
    // устанавливаем начальные параметры для новой игры
    static func newGame() {
        currentTeam = nameTeamNumber1
        currentGame = 1
        currentRound = 1
        pointsTeamNumber1 = 0
        pointsTeamNumber2 = 0
        lengthCurrentRound = lengthWholeRound
        wordNumber = 0
    }
    
}
