//
//  Color.swift
//  Color
//
//  Created by Byoung-Hwi Yoon on 2021/09/21.
//

import Foundation
import UIKit

struct Color {
    var red: ColorValue
    var green: ColorValue
    var blue: ColorValue
    var alpha: ColorValue
    
    var uiColor: UIColor {
        UIColor(red: red.floatValue, green: green.floatValue, blue: blue.floatValue, alpha: alpha.floatValue)
    }
}

struct ColorValue {
    private static let maxValue: CGFloat = 1
    private static let minValue: CGFloat = 0
    
    var floatValue: CGFloat {
        didSet {
            floatValue = Self.safeValue(of: floatValue)
        }
    }
    
    var intValue: Int {
        get {
            Int(floatValue * 255)
        }
        set {
            floatValue = Self.floatValue(from: newValue)
        }
    }
    
    var hexValue: String {
        get {
            String(format:"%02X", intValue)
        }
        set {
            floatValue = Self.floatValue(from: newValue)
        }
    }
    
    init(_ value: CGFloat) {
        floatValue = Self.safeValue(of: value)
    }
    
    init(_ value: Int) {
        self.floatValue =  Self.floatValue(from: value)
    }
    
    init(_ value: String) {
        self.floatValue = Self.floatValue(from: value)
    }
    
    private static func safeValue(of value: CGFloat) -> CGFloat {
        guard (0...1) ~= value else {
            return value > Self.maxValue/2 ? Self.maxValue : Self.minValue
        }
        
        return value
    }
    
    private static func floatValue(from value: Int) -> CGFloat {
        safeValue(of: CGFloat(value)/255)
    }
    
    private static func floatValue(from value: String) -> CGFloat {
        guard let value = Int(value, radix: 16) else {
            return 0
        }
        
        return safeValue(of: CGFloat(value)/255)
    }
}
