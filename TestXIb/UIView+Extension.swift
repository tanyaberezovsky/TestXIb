//
//  File.swift
//  Surikatta
//
//  Created by Tanya Berezovsky on 06/02/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//
//https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/Extensions/UIKit/UIViewExtensions.swift + from
import UIKit

extension UIView {
    
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach({self.addSubview($0)})
    }
    
   func anchorCenterHorizontal(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.safeCenterXAnchor {
            safeCenterXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    func anchorCenterVertical(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.safeCenterYAnchor {
            safeCenterYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    var safeCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        } else {
            return self.centerXAnchor
        }
    }
    
    var safeCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        } else {
            return self.centerYAnchor
        }
    }
   
    public func anchorCenterToSuperView() {
        anchorCenterHorizontal()
        anchorCenterVertical()
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        } else {
            return self.leadingAnchor
        }
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        } else {
            return self.trailingAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
   
    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }

    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0,
        right: NSLayoutXAxisAnchor? = nil, paddingRight: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0,
        left: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0,
        width: CGFloat = 0, height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top,
                                                constant: paddingTop))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left,
                                                 constant: paddingLeft))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom,
                                                   constant: -paddingBottom))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right,
                                                  constant: -paddingRight))
        }
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: CGFloat(width)))
        }
        if height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: CGFloat(height)))
        }
        anchors.forEach {$0.isActive = true}   // activate each one
    }
}
