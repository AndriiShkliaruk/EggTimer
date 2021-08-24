//
//  TimerViewController.swift
//  EggTimer
//
//  Created by Andrii Shkliaruk on 23.08.2021.
//

import UIKit

class TimerViewController: UIViewController {

    var timerCount = 0
    var timer: Timer?
    let shapeLayer = CAShapeLayer()
    @IBOutlet weak var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(timerCount)
        
        //drawing a circle shape layer
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if timerCount >= 0 {
            timerLabel.text = String(timerCount)
            timerCount -= 1
        }
    }
    
    @IBAction func StartTimerButton(_ sender: Any) {
        
        
        let circleAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circleAnimation.toValue = 1
        circleAnimation.duration = CFTimeInterval(timerCount)
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(circleAnimation, forKey: "basicCircleAnimation")
        
        timerCount -= 1
        createTimer()
        
    }
    

}
