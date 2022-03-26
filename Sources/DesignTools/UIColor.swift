//
//  UIColor.swift
//  
//
//  Created by Roman Guseynov on 26.03.2022.
//

import UIKit

extension UIColor: UtilsAvailable {}

extension UIColor {
    public convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0xFF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: 1
        )
    }

    public convenience init(rgba: UInt) {
        self.init(
            red: CGFloat((rgba & 0xFF00_0000) >> 24) / 255.0,
            green: CGFloat((rgba & 0xFF0000) >> 16) / 255.0,
            blue: CGFloat((rgba & 0xFF00) >> 8) / 255.0,
            alpha: CGFloat(rgba & 0xFF) / 255.0
        )
    }

    public convenience init?(hex: String) {
        guard hex.hasPrefix("#") else {
            return nil
        }

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])
        let red, green, blue: CGFloat

        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }

        if hexColor.count == 6 {
            red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(hexNumber & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        } else if hexColor.count == 8 {
            red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            let alpha = CGFloat(hexNumber & 0x000000ff) / 255
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            return nil
        }
    }
}
