//
//  Home.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI

struct Home: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var price: String
    var star: Float
    var style: String
    var image: Image
}

var popular = [
    Home(title: "We Loved It All : A Memory of Life", author: "Millet, Lydia", price: "$28.65$", star: 5, style: "Story", image: Image("We Loved It All")),
    Home(title: "The Art of Eric Carle", author: "Marcus, Leonard S.", price: "$19.99", star: 4.8, style: "Life Style", image: Image("The Art of Eric Carle")),
    Home(title: "Show Me a Story!", author: "Marcus, Leonard S., Wiesner, David", price: "$17.99$", star: 4.7, style: "History", image: Image("Show Me a Story!"))
]


