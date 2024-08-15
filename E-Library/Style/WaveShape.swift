//
//  WaveShape.swift
//  E-Library
//
//  Created by İrem Sever on 3.08.2024.
//

import Foundation
import SwiftUI

struct WaveShape: Shape {
    var amplitude: CGFloat = 12
    var frequency: CGFloat = 7
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midWidth = rect.width / 2
        path.move(to: CGPoint(x: rect.width, y: 0))
        
        for y in stride(from: 0, through: rect.height, by: 1) {
            let relativeY = y / rect.height
            let sine = sin(relativeY * frequency * 2 * .pi)
            let x = rect.width - (amplitude * sine + midWidth)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        return path
    }
}
