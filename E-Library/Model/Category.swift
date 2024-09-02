//
//  Category.swift
//  E-Library
//
//  Created by İrem Sever on 3.08.2024.
//

//import Foundation
//
//
//struct Category: Identifiable {
//    var id = UUID()
//    var text: String
//    var menu: SelectedCategory
//}
//
//enum SelectedCategory: String {
//    case science
//    case magazine
//    case story
//    case general
//    case history
//    case lifestyle
//}
//
//let categoryItem = [
//    Category(text: "Science", menu: .science),
//    Category(text: "Magazine", menu: .magazine),
//    Category(text: "Story", menu: .story),
//    Category(text: "General", menu: .general),
//    Category(text: "History", menu: .history),
//    Category(text: "Lifestyle", menu: .lifestyle)
//]
import Foundation
import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var price: String
    var star: Double
    var style: String
    var image: Image
    var color: Color
}

struct Category: Identifiable {
    var id = UUID()
    var text: String
    var menu: SelectedCategory
    var books: [Book]
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
    Category(
        text: "Science",
        menu: .science,
        books: [
            Book(
                title: "The Hidden Life of Trees",
                author: "Peter Wohlleben",
                price: "$12.37",
                star: 4.07,
                style: "Science, Nature",
                image: Image("The Hidden Life of Trees"),
                color: Color(hex: "#42692f")
            ),
            Book(
                title: "A Short of History Nearly Everything",
                author: "Bill Bryson",
                price: "$12.99",
                star: 4.22,
                style: "Science, History",
                image: Image("A Short of History Nearly Everything"),
                color: Color(hex: "#87CEEB")
            ),
            Book(
                title: "Physics of the Impossible",
                author: "Michio Kaku",
                price: "$12.99",
                star: 4.10,
                style: "Science, Physics, Technology, Space",
                image: Image("Physics of the Impossible"),
                color: Color(hex: "#be29ec")
            ),
            Book(
                title: "The Gene",
                author: "Siddhartha Mukherjee",
                price: "$14.99",
                star: 4.36,
                style: "Science, History, Biology, Medicine",
                image: Image("The Gene"),
                color: Color(hex: "#FFBF00")
            ),
            Book(
                title: "Six Easy Pieces",
                author: "Richard P. Feynman",
                price: "$11.99",
                star: 4.21,
                style: "Science, Physics, Mathematics",
                image: Image("Six Easy Pieces"),
                color: Color(hex: "#D22B2B")
            ),
            Book(
                title: "Astrophysics for People in a Hurry",
                author: "Neil deGrasse Tyson",
                price: "$9.48",
                star: 4.08,
                style: "Science",
                image: Image("Astrophysics for People in a Hurry"),
                color: Color(hex: "#411D57")
            ),
            Book(
                title: "Entangled Life",
                author: "Merlin Sheldrake",
                price: "$9.99",
                star: 4.35,
                style: "Science, Nature, Biology",
                image: Image("Entangled Life"),
                color: Color(hex: "#E97451")
            )
        ]
    ),
    Category(text: "Magazine", 
             menu: .magazine,
             books: [
                Book(
                    title: "A Woman's Place",
                    author: "Sylvia Fraser",
                    price: "$13.10",
                    star: 3.5,
                    style: "Magazine",
                    image: Image("A Woman's Place"),
                    color: Color(hex: "#FFC300")
                ),
                Book(
                    title: "A Bomb in Every Issue",
                    author: "Peter Richardson",
                    price: "$13.34",
                    star: 3.80,
                    style: "History, Journalism",
                    image: Image("A Bomb in Every Issue"),
                    color: Color(hex: "#D70040")
                ),
                Book(
                    title: "In Vogue",
                    author: "Alberto Oliva",
                    price: "$75.00",
                    star: 4.27,
                    style: "Fashion, Art, Photography",
                    image: Image("In Vogue"),
                    color: Color(hex: "#C0C0C0")
                ),
                Book(
                    title: "Not Pretty Enough",
                    author: "Gerri Hirshey",
                    price: "$11.99",
                    star: 3.67,
                    style: "Biography, Nonfiction, History",
                    image: Image("Not Pretty Enough"),
                    color: Color(hex: "#CC5500")
                ),
        ]
    ),
    Category(text: "Story",
             menu: .story,
             books: [
                Book(
                    title: "Astrophysics for People in a Hurry",
                    author: "Neil deGrasse Tyson",
                    price: "$9.48",
                    star: 4.08,
                    style: "Science",
                    image: Image("Astrophysics for People in a Hurry"),
                    color: Color(hex: "#411D57")
                ),
                Book(
                    title: "A Short of History Nearly Everything",
                    author: "Bill Bryson",
                    price: "$12.99",
                    star: 4.22,
                    style: "Science, History",
                    image: Image("A Short of History Nearly Everything"),
                    color: Color(hex: "#87CEEB")
                ),
                Book(
                    title: "The Hidden Life of Trees",
                    author: "Peter Wohlleben",
                    price: "$12.37",
                    star: 4.07,
                    style: "Science, Nature",
                    image: Image("The Hidden Life of Trees"),
                    color: Color(hex: "#42692f")
                ),
                Book(
                    title: "The Gene",
                    author: "Siddhartha Mukherjee",
                    price: "$14.99",
                    star: 4.36,
                    style: "Science, History, Biology, Medicine",
                    image: Image("The Gene"),
                    color: Color(hex: "#FFBF00")
                ),
                Book(
                    title: "Physics of the Impossible",
                    author: "Michio Kaku",
                    price: "$12.99",
                    star: 4.10,
                    style: "Science, Physics, Technology, Space",
                    image: Image("Physics of the Impossible"),
                    color: Color(hex: "#be29ec")
                ),
                Book(
                    title: "Six Easy Pieces",
                    author: "Richard P. Feynman",
                    price: "$11.99",
                    star: 4.21,
                    style: "Science, Physics, Mathematics",
                    image: Image("Six Easy Pieces"),
                    color: Color(hex: "#D22B2B")
                ),
                Book(
                    title: "Entangled Life",
                    author: "Merlin Sheldrake",
                    price: "$9.99",
                    star: 4.35,
                    style: "Science, Nature, Biology",
                    image: Image("Entangled Life"),
                    color: Color(hex: "#E97451")
                )
        ]
    ),
    Category(text: "General",
             menu: .general, 
             books: [
                Book(
                    title: "Astrophysics for People in a Hurry",
                    author: "Neil deGrasse Tyson",
                    price: "$9.48",
                    star: 4.08,
                    style: "Science",
                    image: Image("Astrophysics for People in a Hurry"),
                    color: Color(hex: "#411D57")
                ),
                Book(
                    title: "A Short of History Nearly Everything",
                    author: "Bill Bryson",
                    price: "$12.99",
                    star: 4.22,
                    style: "Science, History",
                    image: Image("A Short of History Nearly Everything"),
                    color: Color(hex: "#87CEEB")
                ),
                Book(
                    title: "The Hidden Life of Trees",
                    author: "Peter Wohlleben",
                    price: "$12.37",
                    star: 4.07,
                    style: "Science, Nature",
                    image: Image("The Hidden Life of Trees"),
                    color: Color(hex: "#42692f")
                ),
                Book(
                    title: "The Gene",
                    author: "Siddhartha Mukherjee",
                    price: "$14.99",
                    star: 4.36,
                    style: "Science, History, Biology, Medicine",
                    image: Image("The Gene"),
                    color: Color(hex: "#FFBF00")
                ),
                Book(
                    title: "Physics of the Impossible",
                    author: "Michio Kaku",
                    price: "$12.99",
                    star: 4.10,
                    style: "Science, Physics, Technology, Space",
                    image: Image("Physics of the Impossible"),
                    color: Color(hex: "#be29ec")
                ),
                Book(
                    title: "Six Easy Pieces",
                    author: "Richard P. Feynman",
                    price: "$11.99",
                    star: 4.21,
                    style: "Science, Physics, Mathematics",
                    image: Image("Six Easy Pieces"),
                    color: Color(hex: "#D22B2B")
                ),
                Book(
                    title: "Entangled Life",
                    author: "Merlin Sheldrake",
                    price: "$9.99",
                    star: 4.35,
                    style: "Science, Nature, Biology",
                    image: Image("Entangled Life"),
                    color: Color(hex: "#E97451")
                )
        ]
    ),
    Category(text: "History",
             menu: .history,
             books: [
                Book(
                    title: "The Twelve Caesars",
                    author: "Suetonius",
                    price: "$3.99",
                    star: 4.01,
                    style: "History, Biography",
                    image: Image("The Twelve Caesars"),
                    color: Color(hex: "#A42A04")
                ),
                Book(
                    title: "Unbroken",
                    author: "Laura Hillenbrand",
                    price: "$9.99",
                    star: 4.38,
                    style: "History, Biography, War",
                    image: Image("Unbroken"),
                    color: Color(hex: "#FFC300")
                ),
                Book(
                    title: "Hiroshima",
                    author: "Peter Wohlleben",
                    price: "$9.99",
                    star: 4.03,
                    style: "History, War",
                    image: Image("Hiroshima"),
                    color: Color(hex: "#EE4B2B")
                ),
                Book(
                    title: "The Rise of Theodore Roosevelt",
                    author: "Edmund Morris",
                    price: "$14.99",
                    star: 4.23,
                    style: "History, Biography",
                    image: Image("The Rise of Theodore Roosevelt"),
                    color: Color(hex: "#555555")
                ),
                Book(
                    title: "Mayflower",
                    author: "Nathaniel Philbrick",
                    price: "$12.99",
                    star: 3.88,
                    style: "History",
                    image: Image("Mayflower"),
                    color: Color(hex: "#e9d700")
                )
               
        ]
    ),
    Category(text: "Lifestyle",
             menu: .lifestyle,
             books: [
                Book(
                    title: "Astrophysics for People in a Hurry",
                    author: "Neil deGrasse Tyson",
                    price: "$9.48",
                    star: 4.08,
                    style: "Science",
                    image: Image("Astrophysics for People in a Hurry"),
                    color: Color(hex: "#411D57")
                ),
                Book(
                    title: "A Short of History Nearly Everything",
                    author: "Bill Bryson",
                    price: "$12.99",
                    star: 4.22,
                    style: "Science, History",
                    image: Image("A Short of History Nearly Everything"),
                    color: Color(hex: "#87CEEB")
                ),
                Book(
                    title: "The Hidden Life of Trees",
                    author: "Peter Wohlleben",
                    price: "$12.37",
                    star: 4.07,
                    style: "Science, Nature",
                    image: Image("The Hidden Life of Trees"),
                    color: Color(hex: "#42692f")
                ),
                Book(
                    title: "The Gene",
                    author: "Siddhartha Mukherjee",
                    price: "$14.99",
                    star: 4.36,
                    style: "Science, History, Biology, Medicine",
                    image: Image("The Gene"),
                    color: Color(hex: "#FFBF00")
                ),
                Book(
                    title: "Physics of the Impossible",
                    author: "Michio Kaku",
                    price: "$12.99",
                    star: 4.10,
                    style: "Science, Physics, Technology, Space",
                    image: Image("Physics of the Impossible"),
                    color: Color(hex: "#be29ec")
                ),
                Book(
                    title: "Six Easy Pieces",
                    author: "Richard P. Feynman",
                    price: "$11.99",
                    star: 4.21,
                    style: "Science, Physics, Mathematics",
                    image: Image("Six Easy Pieces"),
                    color: Color(hex: "#D22B2B")
                ),
                Book(
                    title: "Entangled Life",
                    author: "Merlin Sheldrake",
                    price: "$9.99",
                    star: 4.35,
                    style: "Science, Nature, Biology",
                    image: Image("Entangled Life"),
                    color: Color(hex: "#E97451")
                )
        ]
    )
]
