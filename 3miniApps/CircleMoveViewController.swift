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
    let stepForCirle = 10
    var position: (x: Int, y: Int) = (0, 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if border(direction: .up) < 0 { return }
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
            return Int(circle.frame.origin.y) - stepForCirle - circleSide
        case .down:
            return Int(circle.frame.origin.y) + stepForCirle + circleSide
        }
    }

}
