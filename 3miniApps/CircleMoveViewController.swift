//
//  CircleMoveViewController.swift
//  3miniApps
//
//  Created by murad on 29.10.2022.
//

import UIKit

class CircleMoveViewController: UIViewController {
    
    @IBOutlet var upButton: UIButton!
    
    let circle = UIView()
    let circleWidth = 15
    let circleHeight = 15
    let stepForCirle = 30
    var position: (x: Int, y: Int) = (0, 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        position.x = (Int(view.frame.width / 2) - circleWidth / 2)
        position.y = (Int(view.frame.height / 2) - circleHeight / 2)
        
        circle.frame = CGRect(x: position.x, y: position.y, width: circleWidth, height: circleHeight)
        circle.backgroundColor = .systemPurple
        circle.layer.cornerRadius = CGFloat(circleWidth / 2)
        view.addSubview(circle)
    }
    
    @IBAction func upPressed(_ sender: UIButton) {
        if (position.y - circleHeight) < 0 { return }
        position.y -= stepForCirle
        circle.frame.origin.y = CGFloat(position.y)
    }
    
    @IBAction func leftPressed(_ sender: UIButton) {
        if (position.x - circleWidth) < 0 { return }
        position.x -= stepForCirle
        circle.frame.origin.x = CGFloat(position.x)
    }
    
    @IBAction func rightPressed(_ sender: UIButton) {
        if (position.x + circleWidth) > Int(view.frame.width) { return }
        position.x += stepForCirle
        circle.frame.origin.x = CGFloat(position.x)
    }
    
    @IBAction func downPressed(_ sender: UIButton) {
        let bottomLine = upButton.frame.origin.y - 5
        
        if (position.y + circleHeight) > Int(bottomLine)  { return }
        position.y += stepForCirle
        circle.frame.origin.y = CGFloat(position.y)
    }
}
