//
//  CircleCatViewController.swift
//  3miniApps
//
//  Created by murad on 28.10.2022.
//

import UIKit

class CircleCatViewController: UIViewController {
    
    @IBOutlet var tapButton: UIButton!
    let circle = UIView()
    let widthAndHeightCircle = 200

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapButtonPressed(_ sender: UIButton) {
        //let random = CGFloat.random(in: 0...255.0)
        circle.frame = CGRect(x: randomX(), y: randomY(), width: widthAndHeightCircle, height: widthAndHeightCircle)
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.backgroundColor = UIColor(red: (randomColor()/255.0), green: (randomColor()/255.0), blue: (randomColor()/255.0), alpha: 1.0)
        view.addSubview(circle)
    }
    
    func randomX() -> Int {
        let number = Int.random(in: 0...(Int(view.frame.width) - widthAndHeightCircle))
        //print(view.frame.width)
        return number
    }
    
    func randomY() -> Int {
        let number = Int.random(in: 0...(Int(view.frame.height) - (widthAndHeightCircle + Int((view.frame.height - tapButton.frame.origin.y)))))
        print(tapButton.frame.origin.y)
        return number
    }
    
    func randomColor() -> CGFloat {
        let random = CGFloat.random(in: 0...255.0)
        return random
    }
}
