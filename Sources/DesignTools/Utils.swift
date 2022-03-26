//
//  Utils.swift
//  
//
//  Created by Roman Guseynov on 26.03.2022.
//
import UIKit

public struct Utils<T> {
    public var target: T
}

public protocol UtilsAvailable {
}

extension UtilsAvailable {
    public static var lm: Utils<Self>.Type {
        Utils<Self>.self
    }

    public var lm: Utils<Self> {
        Utils(target: self)
    }
}

extension Utils where T: UIColor {
    public func forcingDarkStyle() -> UIColor {
        if #available(iOS 13.0, *), target.responds(to: #selector(target.resolvedColor(with:))) {
            return target.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))
        } else {
            return target
        }
    }

    public func forcingLightStyle() -> UIColor {
        if #available(iOS 13.0, *), target.responds(to: #selector(target.resolvedColor(with:))) {
            return target.resolvedColor(with: UITraitCollection(userInterfaceStyle: .light))
        } else {
            return target
        }
    }
}
