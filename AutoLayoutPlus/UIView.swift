//
//  UIView.swift
//  AutoLayoutPlus
//
//  Created by Rui Costa on 17/11/15.
//  Copyright © 2015 Rui Costa. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public func centeredInParent(_ multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            centeredInParentY(multiplierY, constant: constantY),
            centeredInParentX(multiplierX, constant: constantX)
        ]
    }
    
    public func centeredInParentY(_ multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return centeredInViewY(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInParentX(_ multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return centeredInViewX(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInView(_ view: UIView, multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            centeredInViewY(view, multiplier: multiplierY, constant: constantY),
            centeredInViewX(view, multiplier: multiplierX, constant: constantX)
        ]
    }

    public func centeredInViewY(_ view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInViewX(_ view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: multiplier, constant: constant)
    }
    
    public func sameDimensionsAsParent(_ multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            sameHeightAsParent(multiplier, constant: constant),
            sameWidthAsParent(multiplier, constant: constant)
        ]
    }
    
    public func sameHeightAsParent(_ multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return sameHeightAsView(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func sameWidthAsParent(_ multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return sameWidthAsView(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func sameDimensionsAsView(_ view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            sameHeightAsView(view, multiplier: multiplier, constant: constant),
            sameWidthAsView(view, multiplier: multiplier, constant: constant)
        ]
    }
    
    public func sameHeightAsView(_ view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: multiplier, constant: constant)
    }
    
    public func sameWidthAsView(_ view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: multiplier, constant: constant)
    }
    
    public func likeParent() -> [NSLayoutConstraint] {
        return sameDimensionsAsParent() + centeredInParent()
    }
    
    public func likeView(_ view: UIView) -> [NSLayoutConstraint] {
        return sameDimensionsAsView(view) + centeredInView(view)
    }
        
}
