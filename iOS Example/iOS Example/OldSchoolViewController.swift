//
//  OldSchoolViewController.swift
//  iOS Example
//
//  Created by Rui Costa on 17/11/15.
//  Copyright © 2015 Rui Costa. All rights reserved.
//

import UIKit

class OldSchoolViewController: UIViewController {
    
    lazy var topContainer: UIView           = self.makeTopContainer()
    lazy var centerGreenContainer: UIView   = self.makeCenterContainer(UIColor.green)
    lazy var centerBlueContainer: UIView    = self.makeCenterContainer(UIColor.blue)
    lazy var centerOrangeContainer: UIView  = self.makeCenterContainer(UIColor.orange)
    lazy var bottomContainer: UIView        = self.makeBottomContainer()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(topContainer)
        view.addSubview(centerBlueContainer)
        view.addSubview(centerGreenContainer)
        view.addSubview(centerOrangeContainer)
        view.addSubview(bottomContainer)
    }
    
    func setupConstraints() {
        let views = ["topContainer": topContainer, "centerBlueContainer": centerBlueContainer, "centerGreenContainer": centerGreenContainer, "centerOrangeContainer": centerOrangeContainer, "bottomContainer": bottomContainer]
        
        // Top container
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[topContainer(==60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[topContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        // Center views
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[centerBlueContainer(==200)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[centerBlueContainer(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[centerGreenContainer(==180)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[centerGreenContainer(==80)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[centerOrangeContainer(==160)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[centerOrangeContainer(==60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        constraints.append(NSLayoutConstraint(item: centerBlueContainer, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: centerBlueContainer, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: centerGreenContainer, attribute: .centerY, relatedBy: .equal, toItem: centerBlueContainer, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: centerGreenContainer, attribute: .centerX, relatedBy: .equal, toItem: centerBlueContainer, attribute: .centerX, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: centerOrangeContainer, attribute: .centerY, relatedBy: .equal, toItem: centerBlueContainer, attribute: .centerY, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: centerOrangeContainer, attribute: .centerX, relatedBy: .equal, toItem: centerBlueContainer, attribute: .centerX, multiplier: 1, constant: 0))
        
        // Bottom container
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[bottomContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        constraints.append(NSLayoutConstraint(item: bottomContainer, attribute: .height, relatedBy: .equal, toItem: topContainer, attribute: .height, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func makeTopContainer() -> UIView {
        let t = UIView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = UIColor.yellow
        
        let leftArea = UIView()
        leftArea.translatesAutoresizingMaskIntoConstraints = false
        leftArea.backgroundColor = UIColor.green
        
        let centerArea = UIView()
        centerArea.translatesAutoresizingMaskIntoConstraints = false
        centerArea.backgroundColor = UIColor.blue
        
        let rightArea = UIView()
        rightArea.translatesAutoresizingMaskIntoConstraints = false
        rightArea.backgroundColor = UIColor.black
        
        t.addSubview(leftArea)
        t.addSubview(centerArea)
        t.addSubview(rightArea)
        
        // Constraints
        
        let views = ["leftArea": leftArea, "centerArea": centerArea, "rightArea": rightArea]
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[leftArea]|", options: .alignAllCenterY, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[leftArea(==60)][centerArea][rightArea(==leftArea)]|", options: .alignAllCenterY, metrics: nil, views: views)
        constraints.append(NSLayoutConstraint(item: leftArea, attribute: .centerY, relatedBy: .equal, toItem: t, attribute: .centerY, multiplier: 1, constant: 0))
        
        constraints.append(NSLayoutConstraint(item: centerArea, attribute: .height, relatedBy: .equal, toItem: leftArea, attribute: .height, multiplier: 1, constant: 0))
        constraints.append(NSLayoutConstraint(item: rightArea, attribute: .height, relatedBy: .equal, toItem: leftArea, attribute: .height, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
        
        return t
    }
    
    func makeCenterContainer(_ backgroundColor: UIColor) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = backgroundColor
        
        return v
    }
    
    func makeBottomContainer() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.red
        
        return v
    }
    
}
