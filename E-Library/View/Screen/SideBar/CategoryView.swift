//
//  CategoryView.swift
//  E-Library
//
//  Created by İrem Sever on 16.07.2024.
//

import SwiftUI

struct CategoryView: View {
    @AppStorage("selectedCategory") private var selectedCategory: SelectedCategory = .science

    var body: some View {
        if let category = categoryItem.first(where: { $0.menu == selectedCategory }) {
            ZStack {
                Color("Background").ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 40) {

                        VStack(spacing: 5) {
                            ForEach(category.books) { book in
                                CategoryCard(book: book)
                                    .scaleEffect(0.8)
                            }
                        }
                    }
                    .padding(0)
                }
            }
        } else {
            Text("Category not found")
        }
    }
}
#Preview {
    CategoryView()
}
