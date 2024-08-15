//
//  Category.swift
//  E-Library
//
//  Created by İrem Sever on 3.08.2024.
//

import Foundation


struct Category: Identifiable {
    var id = UUID()
    var text: String
    var menu: SelectedCategory
}

enum SelectedCategory: String {
    case science
    case magazine
    case story
    case general
    case history
    case lifestyle
}

let categoryItem = [
    Category(text: "Science", menu: .science),
    Category(text: "Magazine", menu: .magazine),
    Category(text: "Story", menu: .story),
    Category(text: "General", menu: .general),
    Category(text: "History", menu: .history),
    Category(text: "Lifestyle", menu: .lifestyle)
]
