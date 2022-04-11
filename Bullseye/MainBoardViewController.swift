//
//  ViewController.swift
//  Bullseye
//
//  Created by Dilnoza on 14.03.2022.
//

import UIKit

class MainBoardViewController: UIViewController {
    
    @IBOutlet weak var rename: UILabel!
    @IBOutlet weak var remainingAttempt: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // Число, которое будут угадывать.
    var guessingNumber = Int.random(in: 1...100)
    
    // Очки игрока.
    var scoreNumber: Int = 0
    
    // Начальное число попыток
    var remainAttempt: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        let highlightedThumbImage = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(normalThumbImage, for: .normal)
        
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        rename.text = "Попробуйте угадать цифру \(guessingNumber)"
        
        setUp()
    }
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        // Забрать часло из слайдера sliderValue
        var sliderValue: Float = slider.value
        
        // Перевести это число в Int , чьабы можно было сравнить
        var sliderValueInt: Int = Int(sliderValue)
        
        print("Значение слайдера: в Float", slider.value)
        print("Значение слайдера: в Int", Int(slider.value))
        
        // Cравнить 2 числа, если они совпадают, то начислить 1 очко.
        if sliderValueInt == guessingNumber {
            scoreNumber += 1
            scoreLabel.text = "Очки: \(scoreNumber)"
            print("Вы угадали число")
        } else {
            print("Вы выбрали число \(sliderValueInt)")
        }
        updateGuessingNumber()
        remAttempt()
    }
    
    // Обновляем.
    @IBAction func tryAgain(_ sender: Any) {
        setUp()
    }
    
    func setUp() {
        // Настойка игры
        // 1. Установить значение слайдера 50
        slider.value = 50
        
        // 2. Установить чтсло, которое будут угадывать
        updateGuessingNumber()
        
        // 3. Обнулить очки
        scoreNumber = 0
        scoreLabel.text = "Очки: \(scoreNumber)"
        
        // 4. Количество попыток
        remainAttempt = 1
        remainingAttempt.text = "Раунд: \(remainAttempt)"
    }
    
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Попробуйте угадать число: " + String(guessingNumber)
    }
    
    func remAttempt() {
        remainAttempt += 1
        remainingAttempt.text = "Раунд: \(remainAttempt)"
        if remainAttempt > 10 {
            remainingAttempt.text = "Раунд 10"
            showResults()
            remainAttempt = 0
        }
    }
    
    func showResults () {
        // Создаем Alert
        let alert: UIAlertController = UIAlertController(title: "Итоги игры", message: "Вы заработали \(scoreNumber) очков", preferredStyle: .alert)
        
        // Создали кнопку для Alert-a
        let okButton: UIAlertAction = UIAlertAction(title: "Начать новую игру", style: .default, handler: { _ in
            // Tут происходят дeйствия при нажатии кнопки
            print("На меня нажали")
            
            self.setUp()
        }
        )
        
        // Добавили кнопку в Alert
        alert.addAction(okButton)
        // Oтобразили Alert на экране
        present(alert, animated: true)
    }
}
