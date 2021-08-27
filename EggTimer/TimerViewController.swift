//
//  TimerViewController.swift
//  EggTimer
//
//  Created by Andrii Shkliaruk on 23.08.2021.
//

import UIKit
import SRCountdownTimer


class TimerViewController: UIViewController {

    var timerValue = 0
    var isTimerRunning: Bool?
    @IBOutlet weak var countdownTimer: SRCountdownTimer!
    @IBOutlet weak var startTimerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer.delegate = self

    }
    
    func configureLayout() {
        //Countdown timer configuration
        countdownTimer.lineWidth = 20
        countdownTimer.lineColor = .yellow
        countdownTimer.useMinutesAndSecondsRepresentation = true
        countdownTimer.labelFont = UIFont(name: "Futura Medium", size: 50)
        countdownTimer.timerFinishingText = "✔️"
        
        //Buttons configuration
        
    }
    
    
    @IBAction func startTimerButtonPressed(_ sender: Any) {
        switch isTimerRunning {
        case true:
            countdownTimer.pause()
            isTimerRunning = false
        case false:
            countdownTimer.resume()
            isTimerRunning = true
        default:
            countdownTimer.start(beginingValue: timerValue)
            isTimerRunning = true
        }
        
    }

    @IBAction func resetTimerButtonPressed(_ sender: Any) {
        countdownTimer.end()
        isTimerRunning = nil
    }
    
}

extension TimerViewController: SRCountdownTimerDelegate {
    func timerDidStart() {
        startTimerButton.setTitle("Pause", for: .normal)
    }
    
    func timerDidPause() {
        startTimerButton.setTitle("Resume", for: .normal)
    }
    
    func timerDidResume() {
        startTimerButton.setTitle("Pause", for: .normal)
    }
    
    func timerDidEnd() {
        startTimerButton.setTitle("Start again", for: .normal)
        isTimerRunning = nil
    }
}

