//
//  OnSteroidsViewController.swift
//  iOS Example
//
//  Created by Rui Costa on 17/11/15.
//  Copyright © 2015 Rui Costa. All rights reserved.
//

import UIKit
import AutoLayoutPlus

class OnSteroidsViewController: UIViewController {

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
        
        var constraints = NSLayoutConstraint.withFormat([
            "V:|[topContainer(==60)]",
            "V:[centerBlueContainer(==200)]",
            "V:[centerGreenContainer(==180)]",
            "V:[centerOrangeContainer(==160)]",
            "V:[bottomContainer]|",
            "H:[centerBlueContainer(==100)]",
            "H:[centerGreenContainer(==80)]",
            "H:[centerOrangeContainer(==60)]",
        ], views: views)
        
        constraints += bottomContainer.sameDimensionsAsView(topContainer)
        constraints += [topContainer.sameWidthAsParent()]
        
        let centerViews = [centerBlueContainer, centerGreenContainer, centerOrangeContainer]
        constraints += NSLayoutConstraint.constraints(items: centerViews, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY)
        constraints += NSLayoutConstraint.constraints(items: centerViews, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX)
        
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
        constraints += NSLayoutConstraint.withFormat("V:|[leftArea]|", options: .alignAllCenterY, views: views)
        constraints += NSLayoutConstraint.withFormat("H:|[leftArea(==60)][centerArea][rightArea(==leftArea)]|", options: .alignAllCenterY, views: views)
        
        constraints += NSLayoutConstraint.constraints(items: [centerArea, rightArea], attribute: .centerY, relatedBy: .equal, toItem: leftArea, attribute: .centerY)
        constraints += NSLayoutConstraint.constraints(items: [centerArea, rightArea], attribute: .height, relatedBy: .equal, toItem: leftArea, attribute: .height)
        
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
