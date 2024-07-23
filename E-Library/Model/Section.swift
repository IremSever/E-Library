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
}

var sections = [
    Section(title: "We Loved It All : A Memory of Life", author: "Millet, Lydia", price: "$18.95", star: 3.5, style: "Story", image: Image("We Loved It All")),
    Section(title: "We Loved It", author: "Lydia", price: "$12.52", star: 4.2, style: "Story", image: Image("The Art of Eric Carle")),
    Section(title: "It All", author: "Millet", price: "$17.43", star: 3.8, style: "Story", image: Image("Show Me a Story!")),
    Section(title: "A Memory of Life", author: "Millet, Lydia", price: "$32.05", star: 2.9, style: "Story", image: Image("We Loved It All"))
]
