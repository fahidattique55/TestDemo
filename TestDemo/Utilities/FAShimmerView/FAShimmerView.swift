//
//  FAShimmerView.swift
//  FanTazTech
//
//  Created by Fahid Attique on 16/02/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//

import UIKit

class FAShimmerView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAndStartShimmering()
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

class FASimpleShimmerImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAndStartShimmering()
    }
    
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

class FAShimmerButtonView: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAndStartShimmering()
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

class FAShimmerLabelView: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAndStartShimmering()
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}


extension UIView {
    
    fileprivate func configureAndStartShimmering() {
        
        backgroundColor = UIColor.black.withAlphaComponent(0.10)
        startShimmering()
    }
}
