//
//  CustomFont.swift
//  E-Library
//
//  Created by İrem Sever on 3.06.2024.
//

import Foundation
import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 19
        case .body:
            return 17
        case .subheadline:
            return 17
        case .footnote:
            return 15
        case .caption:
            return 15
        case .headline:
            return 13
        case .subheadline2:
            return 13
        case .footnote2:
            return 12
        case .caption2:
            return 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .subheadline:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption:
            return .caption
        case .headline:
            return .headline
        case .subheadline2:
            return .subheadline
        case .footnote2:
            return .footnote
        case .caption2:
            return .caption2
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}
extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {
    case largeTitle, title, title2, title3
    case body, subheadline, footnote, caption
    case headline, subheadline2, footnote2, caption2
}
