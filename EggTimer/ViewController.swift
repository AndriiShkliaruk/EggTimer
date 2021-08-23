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
        var timerCount = 0
        
        switch segue.identifier {
        case "SoftBoiledTimer":
            timerCount = 4
        case "MediumBoiledTimer":
            timerCount = 6
        case "HardBoiledTimer":
            timerCount = 10
        default:
            return
        }
        
        guard let destination = segue.destination as? TimerViewController else { return }
        destination.timerCount = timerCount
    }


}

