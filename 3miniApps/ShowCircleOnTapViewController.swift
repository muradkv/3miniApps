//
//  ShowCircleOnTapViewController.swift
//  3miniApps
//
//  Created by murad on 03.11.2022.
//

import UIKit

class ShowCircleOnTapViewController: UIViewController {
    
    var arrayViews = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchBegan))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @IBAction func touchBegan(_ sender: UIPanGestureRecognizer) {
        let circle = UIView()
        circle.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.backgroundColor = .brown
        circle.center = sender.location(in: view)
        
        for i in arrayViews {
            if (circle.frame.intersects(i.frame)) {
                    print("True")
                    return
                }
        }
        
        arrayViews.append(circle)
        view.addSubview(circle)
    }
}
