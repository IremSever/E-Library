//
//  Poppins-Bold.swift
//  E-Library
//
//  Created by İrem Sever on 3.06.2024.
//

import Foundation
import SwiftUI

struct PoppinsBold: ViewModifier {
    
    
    
    func body(content: Content) -> some View {
        content.font(.custom("Poppins Bold", size: 60,  relativeTo: .largeTitle))

    }
}

