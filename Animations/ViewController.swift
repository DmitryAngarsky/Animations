//
//  ViewController.swift
//  Animations
//
//  Created by Дмитрий Тараканов on 09.12.2019.
//  Copyright © 2019 Dmitry Angarsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapGreen: UIView!
    @IBOutlet weak var orangeSquare: UIView!
    @IBOutlet weak var purpleSquare: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var yellowSquare: UIView!
    @IBOutlet weak var helloView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGreen.layer.cornerRadius = 20
        orangeSquare.layer.cornerRadius = 20
        
        purpleSquare.layer.cornerRadius = 21.5
        purpleSquare.layer.shadowOffset = CGSize(width: 5, height: 5)
        purpleSquare.layer.shadowRadius = 20
        purpleSquare.layer.shadowOpacity = 0.7 // 2
        purpleSquare.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeUpGesture(recognizer:)))
        swipeUp.direction = .up
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDownGesture(recognizer:)))
        swipeDown.direction = .down

        helloView.addGestureRecognizer(swipeUp)
        helloView.addGestureRecognizer(swipeDown)
    }
    
    @objc func swipeDownGesture(recognizer: UIGestureRecognizer) {
    
       let animationUp = CABasicAnimation(keyPath: #keyPath(CALayer.position))
       animationUp.fromValue = helloView.layer.position
       animationUp.toValue = [view.bounds.width / 2, view.bounds.height]
       animationUp.duration = 1
       
       helloView.layer.add(animationUp, forKey: nil)
    }
    
    @objc func swipeUpGesture(recognizer: UIGestureRecognizer) {
     
        let animationUp = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animationUp.fromValue = helloView.layer.position
        animationUp.toValue = [view.bounds.width / 2, 0]
        animationUp.duration = 1
        
        helloView.layer.add(animationUp, forKey: nil)
     }
    
    @IBAction func tapToYellow(_ sender: Any) {
        
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = 0
        cornerAnimation.toValue = 70

        let colorChangeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorChangeAnimation.fromValue = yellowSquare.layer.backgroundColor
        colorChangeAnimation.toValue = UIColor.red.cgColor
        
        let rotate = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.transform))
        rotate.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotate.fromValue = 0
        rotate.toValue = 8 * Float.pi
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2
        animationGroup.animations = [cornerAnimation, colorChangeAnimation, rotate]
        yellowSquare.layer.add(animationGroup, forKey: nil)
    }
    
    @IBAction func tapToPurple(_ sender: Any) {
        
        let spring = CASpringAnimation(keyPath: "position.y")
        spring.damping = 3
        spring.fromValue = purpleSquare.layer.position.y
        spring.toValue = purpleSquare.layer.position.y - 100
        spring.duration = spring.settlingDuration
        
        purpleSquare.layer.add(spring, forKey: nil)
    }
    
    @IBAction func tapOnOrange(_ sender: Any) {
        
        let spring = CASpringAnimation(keyPath: "transform.scale")
        spring.damping = 3
        spring.fromValue = 0
        spring.toValue = 1
        spring.duration = spring.settlingDuration
                    
        orangeSquare.layer.add(spring, forKey: nil)
    }
    
    @IBAction func tapOnGreen(_ sender: Any) {
        
        let rotate = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.transform))
        rotate.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotate.fromValue = 0
        rotate.toValue = 4 * Float.pi
        rotate.duration = 2
            
        tapGreen.layer.add(rotate, forKey: nil)
    }

}
