#AutoLayoutPlus

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)
[![CocoaPods](https://img.shields.io/cocoapods/v/AutoLayoutPlus.svg)]()
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

AutoLayoutPlus is a Swift library consisting in a set of extensions to help dealing with Auto Layout programatically. 
With AutoLayoutPlus you don't need to change the way you've always worked with Auto Layout, it should feel as natural complement.

Keep reading for some more details on what's included (and have a look at the example provided)!

##Features

- [x] AutoLayoutPlus complements the existing UIKit methods to create constraints for your views.
- [x] Helper methods for the most repetitive tasks (center view, apply the same constraint to multiple views, fill view horizontally, etc).
- [x] Makes your code less verbose and easier to follow.
- [x] No need to learn yet another DSL or library: AutoLayoutPlus feels natural and provides a similar experience to the methods you are already familiar with!

##Requirements

* iOS 8.0+
* Xcode 7.0+

##Instalation

###CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AutoLayoutPlus into your Xcode project using CocoaPods, include this in your Podfile:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'AutoLayoutPlus'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate AutoLayoutPlus into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ruipfcosta/AutoLayoutPlus"
```

Run `carthage` to build the framework and drag the built `AutoLayoutPlus.framework` into your Xcode project.

##Extensions

AutoLayoutPlus works by adding some useful extensions to NSLayoutConstraint and UIView classes. To make use of those extensions don't forget to import AutoLayoutPlus into your code:

```swift
import AutoLayoutPlus
```

To help reducing the verbosity of the code, the ```multiplier``` and ```constant``` arguments have default values 1 and 0, respectively, so you won't have to specify them unless absolutely necessary.

###NSLayoutConstraint extensions

```swift
convenience init(item view1: AnyObject, attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem view2: AnyObject?, attribute attr2: NSLayoutAttribute)
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)

// AutoLayoutPlus style
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY)
```

---

```swift
class func withFormat(format: String, options: NSLayoutFormatOptions = NSLayoutFormatOptions(rawValue: 0), metrics: [String : AnyObject]? = nil, views: [String : AnyObject]) -> [NSLayoutConstraint]
```

####Usage:

```swift
// Old style
NSLayoutConstraint.constraintsWithVisualFormat("V:|[topContainer(==60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

// AutoLayoutPlus style
NSLayoutConstraint.withFormat("V:|[topContainer(==60)]", views: views)
```

---

```swift
class func constraints(items views: [AnyObject], attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem view: AnyObject?, attribute attr2: NSLayoutAttribute, multiplier: CGFloat = 1, constant c: CGFloat = 0) -> [NSLayoutConstraint]
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerGreenContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerOrangeContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)

// AutoLayoutPlus style
NSLayoutConstraint.constraints(items: [centerBlueContainer, centerGreenContainer, centerOrangeContainer], attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY)
```

###UIView extensions

```swift
func centeredInParent(multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint]
func centeredInView(view: UIView, multiplierX: CGFloat = 1, constantX: CGFloat = 0, multiplierY: CGFloat = 1, constantY: CGFloat = 0) -> [NSLayoutConstraint]
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0)
        
// AutoLayoutPlus style
centerBlueContainer. centeredInParent()
```

---

```swift
func centeredInParentY(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func centeredInParentX(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func centeredInViewY(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func centeredInViewX(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
        
// AutoLayoutPlus style
centerBlueContainer. centeredInParentY()
```

---

```swift
func sameDimensionsAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint]
func sameDimensionsAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> [NSLayoutConstraint]
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerBlueContainer, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        
// AutoLayoutPlus style
centerBlueContainer. sameDimensionsAsParent()
```

---

```swift
func sameHeightAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func sameWidthAsParent(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func sameHeightAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
func sameWidthAsView(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        
// AutoLayoutPlus style
centerBlueContainer. sameHeightAsParent()
```

---

```swift
func likeParent() -> [NSLayoutConstraint]
func likeView(view: UIView) -> [NSLayoutConstraint]
```

####Usage:

```swift
// Old style
NSLayoutConstraint(item: centerBlueContainer, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerBlueContainer, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0)
     
// AutoLayoutPlus style
centerBlueContainer. likeParent()
```


## Credits

Owned and maintained by Rui Costa ([@ruipfcosta](https://twitter.com/ruipfcosta)). 

## Contributing

Bug reports and pull requests are welcome.

## License

AutoLayoutPlus is released under the MIT license. See LICENSE for details.
