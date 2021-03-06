//
//  ViewController.swift
//  EggTimer
//
//  Created by Andrii Shkliaruk on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var timerValue = 0
        
        switch segue.identifier {
        case "SoftBoiledTimer":
            timerValue = 3*60
        case "MediumBoiledTimer":
            timerValue = 4*60
        case "HardBoiledTimer":
            timerValue = 8*60
        default:
            return
        }
        
        guard let destination = segue.destination as? TimerViewController else { return }
        destination.timerValue = timerValue
    }


}


