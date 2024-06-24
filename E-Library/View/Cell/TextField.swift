//
//  TextField.swift
//  E-Library
//
//  Created by İrem Sever on 23.06.2024.
//

import SwiftUI

struct TextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 15.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .overlay(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            )
            .overlay(
                Image("Icon Email")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            )
    }
}

extension View {
    func textField() -> some View {
        modifier(TextField())
    }
}

