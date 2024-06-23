//
//  Inter-Regular.swift
//  E-Library
//
//  Created by İrem Sever on 3.06.2024.
//

import Foundation
import SwiftUI

struct InterRegular: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.custom("Inter Regular", size: 20,  relativeTo: .largeTitle))
    }
}
