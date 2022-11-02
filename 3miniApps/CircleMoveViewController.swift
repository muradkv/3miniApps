//
//  CircleMoveViewController.swift
//  3miniApps
//
//  Created by murad on 29.10.2022.
//

import UIKit

enum Direction {
    case right
    case left
    case up
    case down
}

class CircleMoveViewController: UIViewController {
    
    @IBOutlet var upButton: UIButton!
    
    let circle = UIView()
    let circleSide = 15
    let stepForCirle = 15
    var position: (x: Int, y: Int) = (0, 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swipeDirection(direction: .right)
        swipeDirection(direction: .down)
        swipeDirection(direction: .up)
        swipeDirection(direction: .left)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = (Int(view.frame.width / 2) - circleSide / 2)
        let yCenter = (Int(view.frame.height / 2) - circleSide / 2)
        
        circle.frame = CGRect(x: xCenter, y: yCenter, width: circleSide, height: circleSide)
        circle.backgroundColor = .systemPurple
        circle.layer.cornerRadius = CGFloat(circleSide / 2)
        view.addSubview(circle)
    }
    
    @IBAction func upPressed(_ sender: UIButton) {
        if border(direction: .up) < Int(view.safeAreaInsets.top) { return }
        circle.frame.origin.y -= CGFloat(stepForCirle)
    }
    
    @IBAction func leftPressed(_ sender: UIButton) {
        if border(direction: .left)  < 0 { return }
        circle.frame.origin.x -= CGFloat(stepForCirle)
    }
    
    @IBAction func rightPressed(_ sender: UIButton) {
        if border(direction: .right) > Int(view.frame.width)  { return }
        circle.frame.origin.x += CGFloat(stepForCirle)
    }
    
    @IBAction func downPressed(_ sender: UIButton) {
        if border(direction: .down) > Int(upButton.frame.origin.y)  { return }
        circle.frame.origin.y += CGFloat(stepForCirle)
    }
    
    func border(direction: Direction) -> Int {
        switch direction {
        case .right:
            return Int(circle.frame.origin.x) + stepForCirle + circleSide
        case .left:
            return Int(circle.frame.origin.x) - stepForCirle - circleSide
        case .up:
            return Int(circle.frame.origin.y) - stepForCirle
        case .down:
            return Int(circle.frame.origin.y) + stepForCirle
        }
    }
    
    func swipeDirection(direction: Direction) {
        switch direction {
        case .right:
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightPressed))
            gestureRecognizer.direction = .right
            view.addGestureRecognizer(gestureRecognizer)
        case .left:
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftPressed))
            gestureRecognizer.direction = .left
            view.addGestureRecognizer(gestureRecognizer)
        case .up:
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(upPressed))
            gestureRecognizer.direction = .up
            view.addGestureRecognizer(gestureRecognizer)
        case .down:
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downPressed))
            gestureRecognizer.direction = .down
            view.addGestureRecognizer(gestureRecognizer)
        }
    }

}
