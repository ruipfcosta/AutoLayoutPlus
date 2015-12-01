//
//  NSLayoutConstraint.swift
//  AutoLayoutPlus
//
//  Created by Rui Costa on 17/11/15.
//  Copyright © 2015 Rui Costa. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutConstraint {
    
    public convenience init(item view1: AnyObject, attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem view2: AnyObject?, attribute attr2: NSLayoutAttribute) {
        self.init(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: 1, constant: 0)
    }
    
    public class func constraints(items views: [AnyObject], attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem view: AnyObject?, attribute attr2: NSLayoutAttribute, multiplier: CGFloat = 1, constant c: CGFloat = 0) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint(item: $0, attribute: attr1, relatedBy: relation, toItem: view, attribute: attr2, multiplier: multiplier, constant: c) }
    }
    
    public class func withFormat(format: String, options: NSLayoutFormatOptions = NSLayoutFormatOptions(rawValue: 0), metrics: [String : AnyObject]? = nil, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views)
    }

}
