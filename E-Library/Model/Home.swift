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
    Home(title: "Good Energy", author: "Casey Means MD", price: "$31.97$", star: 4.5, style: "Personal Growth", image: Image("GoodEnergy")),
    Home(title: "It Starts With Us", author: "Colleen Hoover", price: "$35.74", star: 4.4, style: "Romance", image: Image("ItStartsWithUs")),
    Home(title: "1984", author: "George Orwell", price: "$9.99$", star: 4.6, style: "Dystopian, Science Fiction", image: Image("1984")),
    Home(title: "Of Mice and Men", author: "John Steinbeck", price: "$4.99", star: 4.6, style: "Tragedy", image: Image("OfMiceAndMen")),
    Home(title: "Calm the Chaos", author: "Angela Wade", price: "$16.99$", star: 4.3, style: "Personal Growth", image: Image("CalmTheChaos"))
]


