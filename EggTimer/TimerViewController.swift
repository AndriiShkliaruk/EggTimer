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
        
        let center = view.center
        
        //Track shape layer
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(trackLayer)
        
        //Circle shape layer
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func createTimer() {
        timerCount -= 1
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
        circleAnimation.duration = CFTimeInterval(timerCount + 1)
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(circleAnimation, forKey: "basicCircleAnimation")
        
        
        createTimer()
        
    }
    

}
