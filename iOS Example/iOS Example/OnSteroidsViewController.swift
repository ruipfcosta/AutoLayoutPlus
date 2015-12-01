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
    lazy var centerGreenContainer: UIView   = self.makeCenterContainer(UIColor.greenColor())
    lazy var centerBlueContainer: UIView    = self.makeCenterContainer(UIColor.blueColor())
    lazy var centerOrangeContainer: UIView  = self.makeCenterContainer(UIColor.orangeColor())
    lazy var bottomContainer: UIView        = self.makeBottomContainer()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
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
        
        view.addConstraints(NSLayoutConstraint.withFormat([
            "V:|[topContainer(==60)]",
            "V:[centerBlueContainer(==200)]",
            "V:[centerGreenContainer(==180)]",
            "V:[centerOrangeContainer(==160)]",
            "V:[bottomContainer]|",
            "H:[centerBlueContainer(==100)]",
            "H:[centerGreenContainer(==80)]",
            "H:[centerOrangeContainer(==60)]",
        ], views: views))

        view.addConstraint(topContainer.sameWidthAsParent())
        view.addConstraints(bottomContainer.sameDimensionsAsView(topContainer))
        
        let centerViews = [centerBlueContainer, centerGreenContainer, centerOrangeContainer]
        view.addConstraints(NSLayoutConstraint.constraints(items: centerViews, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY))
        view.addConstraints(NSLayoutConstraint.constraints(items: centerViews, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX))
    }
    
    func makeTopContainer() -> UIView {
        let t = UIView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = UIColor.yellowColor()
        
        let leftArea = UIView()
        leftArea.translatesAutoresizingMaskIntoConstraints = false
        leftArea.backgroundColor = UIColor.greenColor()
        
        let centerArea = UIView()
        centerArea.translatesAutoresizingMaskIntoConstraints = false
        centerArea.backgroundColor = UIColor.blueColor()
        
        let rightArea = UIView()
        rightArea.translatesAutoresizingMaskIntoConstraints = false
        rightArea.backgroundColor = UIColor.blackColor()
        
        t.addSubview(leftArea)
        t.addSubview(centerArea)
        t.addSubview(rightArea)
        
        // Constraints
        
        let views = ["leftArea": leftArea, "centerArea": centerArea, "rightArea": rightArea]
        
        t.addConstraints(NSLayoutConstraint.withFormat("V:|[leftArea]|", options: .AlignAllCenterY, views: views))
        t.addConstraints(NSLayoutConstraint.withFormat("H:|[leftArea(==60)][centerArea][rightArea(==leftArea)]|", options: .AlignAllCenterY, views: views))
        
        t.addConstraints(NSLayoutConstraint.constraints(items: [centerArea, rightArea], attribute: .CenterY, relatedBy: .Equal, toItem: leftArea, attribute: .CenterY))
        t.addConstraints(NSLayoutConstraint.constraints(items: [centerArea, rightArea], attribute: .Height, relatedBy: .Equal, toItem: leftArea, attribute: .Height))
        
        return t
    }
    
    func makeCenterContainer(backgroundColor: UIColor) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = backgroundColor
        
        return v
    }
    
    func makeBottomContainer() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.redColor()
        
        return v
    }

}
