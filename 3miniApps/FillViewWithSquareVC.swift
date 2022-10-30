//
//  FillViewWithSquareVC.swift
//  3miniApps
//
//  Created by murad on 28.10.2022.
//

import UIKit

class FillViewWithSquareVC: UIViewController {
    @IBOutlet var fillButton: UIButton!
    @IBOutlet var valueSlider: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var slideStackView: UIStackView!
    
    var position: (x: Int, y: Int) = (0, 0)
    var sideSquare: Float = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureSlider(with: slider)
    }

    @IBAction func fillButtonPressed(_ sender: UIButton) {
        slideStackView.isHidden = true
        
        let square = UIView()
        square.frame = CGRect(x: position.x, y: position.y, width: Int(sideSquare), height: Int(sideSquare))
        square.backgroundColor = RandomColor.makeColor()
        
        if (position.y + Int(sideSquare)) > Int(fillButton.frame.origin.y) {
            return
        }
        
        position.x += Int(sideSquare)
        
        if (position.x + Int(sideSquare)) > Int(view.frame.width) {
            position.x = 0
            position.y += Int(sideSquare)
        }

        view.addSubview(square)
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        sideSquare = value
        valueSlider.text = String(format: "%.f", value)
    }
    
    func configureSlider(with slider: UISlider) {
        valueSlider.text = "\(Int(sideSquare))"
        slider.maximumValue = Float(view.frame.width)
        slider.minimumValue = 1
        slider.value = sideSquare
    }
}
