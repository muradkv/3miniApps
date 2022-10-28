//
//  FillViewWithSquareVC.swift
//  3miniApps
//
//  Created by murad on 28.10.2022.
//

import UIKit

class FillViewWithSquareVC: UIViewController {
    @IBOutlet var fillButton: UIButton!
    
    var position: (x: Int, y: Int) = (0, 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func fillButtonPressed(_ sender: UIButton) {
        let square = UIView()
        square.frame = CGRect(x: position.x, y: position.y, width: 100, height: 100)
        square.backgroundColor = UIColor.systemPurple
        let widthSquare = Int(square.frame.width)
        let heightSquare = Int(square.frame.height)
        let bottomLine = Int(view.frame.height - (view.frame.height - fillButton.frame.origin.y))
        
        if (position.y + heightSquare) > bottomLine {
            return
        }
        
        position.x += widthSquare
        
        if (position.x + widthSquare) > Int(view.frame.width) {
            position.x = 0
            position.y += heightSquare
        }

        view.addSubview(square)
    }
}
