//
//  UIView.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 28/12/20.
//

import UIKit

extension UIView {

    @IBInspectable var circular: Bool {
        get { layer.cornerRadius == CGFloat(bounds.width) }
        set {
            layoutIfNeeded()
            layer.cornerRadius = newValue ? CGFloat(bounds.width/2) : 0
        }
    }

    @IBInspectable var cornerRadius: Float {
        get { Float(layer.cornerRadius) }
        set { clipsToBounds = true
            layer.cornerRadius = CGFloat(newValue) }
    }

    @IBInspectable var borderWidth: Float {
        get { Float(layer.borderWidth) }
        set { layer.borderWidth = CGFloat(newValue) }
    }

    @IBInspectable var borderColor: UIColor {
        get { .white }
        set { layer.borderColor = newValue.cgColor }
    }
}
