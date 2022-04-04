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
    
    // Chislo, kotoroe doljen ugadat.
    var guessingNumber = Int.random(in: 1...100)
    // Ochki igroka.
    var scoreNumber: Int = 0
    
    // nachalnoe znachenie
    var remainAttempt: Int = 1
    @IBOutlet weak var slider: UISlider!
    
    
   
    
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
            // Cравнить 2 числа, если они совпадают, то начислить 1 очко
            if sliderValueInt == guessingNumber {
                scoreNumber += 1
                scoreLabel.text = "Очки: \(scoreNumber)"
                print("Вы угадали число")
            } else {
                print("Вы выбрали число \(sliderValueInt)")
            }
            updateGuessingNumber()
            remAttempt()
            resetPoints ()
            
    }
    // Обновляем
    @IBAction func `return`(_ sender: Any) {
        setUp()
    }
    
    func setUp () {
        // Nastroyka igri
        // 1. Ustanovit znachenie slaydera 50
            slider.value = 50
        // 2.Ustanovit chislo kotoroe budut ugadivat
       updateGuessingNumber()
        
        // 3. Obnulit ochki
            scoreNumber = 0
            scoreLabel.text = "Очки: \(scoreNumber)"
        
        // kolichestvo popitok
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
        if remainAttempt == 10 {
            remainAttempt = 0
        }
    }
    //func resetPoints () {
         //scoreNumber = 0
       // scoreLabel.text = "Очки: \(scoreNumber)"
    }
    }
    


