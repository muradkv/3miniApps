//
//  RandomColor.swift
//  3miniApps
//
//  Created by murad on 30.10.2022.
//

import Foundation
import UIKit

final class RandomColor {
    
    static func makeColor() -> UIColor {
        let color = UIColor(red: random(), green: random(), blue: random(), alpha: 1.0)
        return color
    }
    
    static private func random() -> CGFloat {
        let random = CGFloat.random(in: 0...255.0) / 255
        return random
    }
    
}
