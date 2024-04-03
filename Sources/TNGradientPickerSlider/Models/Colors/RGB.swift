//
//  RGB.swift
//  TNGradientPickerSlider
//
//  Created by Frederik Jacques on 02/06/2023.
//  Original: https://github.com/louisdh/huekit/blob/master/HueKit/Model/RGB.swift
//

import Foundation
import AppKit

struct RGB: Hashable {
    /// The value for the red channel (0...1)
    let red: CGFloat
    
    /// The value for the green channel (0...1)
    let green: CGFloat
    
    /// The value for the blue channel (0...1)
    let blue: CGFloat
}

extension RGB {
    
    /// Create an RGB instance with a default white color.
    init() {
        self.init(red: 1.0, green: 1.0, blue: 1.0)
    }
    
    /// Convert RGB values to HSB.
    /// - Parameters:
    ///   - preserveHS: Keep the Hue & Saturation values if brightness becomes 0 (which results in black)
    ///   - hue: The hue value
    ///   - saturation: The saturation value
    /// - Returns: An HSB instance.
    func toHSB() -> HSB {
        let color = NSColor(deviceRed: red, green: green, blue: blue, alpha: 1.0)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return HSB(hue: hue * 360, saturation: saturation, brightness: brightness)
    }
}
