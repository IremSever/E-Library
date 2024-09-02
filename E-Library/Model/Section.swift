//
//  Section.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var price: String
    var star: Float
    var style: String
    var image: Image
    var color: Color
}

var sections = [
    
    Section(title: "The Wild Robot", author: "Peter Brown", price: "$7.99", star: 4.8, style: "Science Fiction", image: Image("TheWildRobot"), color: Color(hex: "#4F7942")),
    Section(title: "Every Summer After", author: "Carley Fortune", price: "$9.02", star: 4.5, style: "Romance,", image: Image("EverySummerAfter"), color: Color(hex: "    #89CFF0")),
    Section(title: "The Women", author: "Kristin Hannah", price: "$14.99", star: 3.8, style: "Historical, War Story", image: Image("TheWomen"), color: Color(hex: "    #FF2400")),
    Section(title: "The Four Agreements", author: "Don Miguel Ruiz", price: "$6.73", star: 4.7, style: "Spiritualism, Personal Growth", image: Image("TheFourAgreements"), color: Color(hex: "#FFAC1C")),
]


extension Color {
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    func darker(by percentage: Double) -> Color {
        let adjustment = 1.0 - percentage / 100.0
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        
        return Color(red: Double(red) * adjustment, green: Double(green) * adjustment, blue: Double(blue) * adjustment, opacity: Double(opacity))
    }
}
