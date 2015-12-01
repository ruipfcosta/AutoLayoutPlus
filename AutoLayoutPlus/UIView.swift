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
    
    public func centeredInParent(multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            centeredInParentY(multiplierY, constant: constantY),
            centeredInParentX(multiplierX, constant: constantX)
        ]
    }
    
    public func centeredInParentY(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return centeredInViewY(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInParentX(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return centeredInViewX(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInView(view: UIView, multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            centeredInViewY(view, multiplier: multiplierY, constant: constantY),
            centeredInViewX(view, multiplier: multiplierX, constant: constantX)
        ]
    }

    public func centeredInViewY(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: multiplier, constant: constant)
    }
    
    public func centeredInViewX(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: multiplier, constant: constant)
    }
    
    public func sameDimensionsAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            sameHeightAsParent(multiplier, constant: constant),
            sameWidthAsParent(multiplier, constant: constant)
        ]
    }
    
    public func sameHeightAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return sameHeightAsView(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func sameWidthAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return sameWidthAsView(superview!, multiplier: multiplier, constant: constant)
    }
    
    public func sameDimensionsAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            sameHeightAsView(view, multiplier: multiplier, constant: constant),
            sameWidthAsView(view, multiplier: multiplier, constant: constant)
        ]
    }
    
    public func sameHeightAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: multiplier, constant: constant)
    }
    
    public func sameWidthAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: multiplier, constant: constant)
    }
    
    public func likeParent() -> [NSLayoutConstraint] {
        return sameDimensionsAsParent() + centeredInParent()
    }
    
    public func likeView(view: UIView) -> [NSLayoutConstraint] {
        return sameDimensionsAsView(view) + centeredInView(view)
    }
        
}
