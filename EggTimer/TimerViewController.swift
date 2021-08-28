//
//  TimerViewController.swift
//  EggTimer
//
//  Created by Andrii Shkliaruk on 23.08.2021.
//

import AVFoundation
import UIKit
import SRCountdownTimer


class TimerViewController: UIViewController {

    var timerValue = 0
    var isTimerRunning: Bool?
    @IBOutlet weak var countdownTimer: SRCountdownTimer!
    @IBOutlet weak var startTimerButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Countdown timer setup
        countdownTimer.delegate = self
        countdownTimer.useMinutesAndSecondsRepresentation = true
        countdownTimer.labelFont = UIFont(name: "Futura Medium", size: 50)
        countdownTimer.timerFinishingText = "✔️"
    }
    
    
    @IBAction func startTimerButtonPressed(_ sender: Any) {
        switch isTimerRunning {
        case true:
            countdownTimer.pause()
        case false:
            countdownTimer.resume()
        default:
            countdownTimer.start(beginingValue: timerValue)
        }
    }

    
    @IBAction func resetTimerButtonPressed(_ sender: Any) {
        countdownTimer.reset()
        isTimerRunning = nil
        startTimerButton.setTitle("Start again", for: .normal)
    }
    
}


//Delegate timer methods
extension TimerViewController: SRCountdownTimerDelegate {
    func timerDidStart() {
        startTimerButton.setTitle("Pause", for: .normal)
        isTimerRunning = true
        infoLabel.isHidden = true
    }
    
    func timerDidPause() {
        startTimerButton.setTitle("Resume", for: .normal)
        isTimerRunning = false
    }
    
    func timerDidResume() {
        startTimerButton.setTitle("Pause", for: .normal)
        isTimerRunning = true
    }
    
    func timerDidEnd() {
        startTimerButton.setTitle("Start again", for: .normal)
        isTimerRunning = nil
        AudioServicesPlaySystemSound(1304)
    }
}


