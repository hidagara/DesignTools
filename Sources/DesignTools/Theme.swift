//
//  Theme.swift
//  
//
//  Created by Roman Guseynov on 26.03.2022.
//

import UIKit

public protocol Theme {
    var font: UIFont { get }
    var backgroundColor: UIColor { get }
}


public final class BaseTheme: Theme {
    public var font: UIFont {
        .systemFont(ofSize: 10)
    }

    public var backgroundColor: UIColor {
        BaseTheme.dynamicColor(light: 0xD62839, dark: 0xD62839)
    }
    public init() {}
}

// MARK: - Static
extension Theme {
    public static func dynamicColor(light: Int, dark: Int) -> UIColor {
        if #available(iOS 13.0, *), UIColor.instancesRespond(to: #selector(UIColor.init(dynamicProvider:))) {
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor(rgb: dark)
                default:
                    return UIColor(rgb: light)
                }
            }
        } else {
            return UIColor(rgb: light)
        }
    }

    public static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *), UIColor.instancesRespond(to: #selector(UIColor.init(dynamicProvider:))) {
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dark
                default:
                    return light
                }
            }
        } else {
            return light
        }
    }
}
