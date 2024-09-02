//
//  CategoryCard.swift
//  E-Library
//
//  Created by İrem Sever on 2.09.2024.
//

import Foundation
import SwiftUI

struct CategoryCard: View {
    var book: Book

    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 15) {
                Spacer(minLength: 115)

                VStack(alignment: .leading, spacing: 4) {
                    Text(book.title)
                        .customFont(.title3)
                        .lineLimit(3)
                        .opacity(0.8)
                        .truncationMode(.tail)
                        .foregroundColor(book.color.darker(by: 90))

                    Text(book.style)
                        .customFont(.caption2)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .foregroundColor(book.color.darker(by: 80))

                    Text(book.price)
                        .customFont(.caption)
                        .foregroundColor(book.color.darker(by: 80))
                }

                Spacer()

                VStack(spacing: 5) {
                    ForEach(0..<5) { index in
                        Image(systemName: getStarType(for: index, rating: book.star))
                            .foregroundColor(book.color.darker(by: 70))
                            .opacity(0.6)
                            .font(.system(size: 12))
                            .rotationEffect(.degrees(70))
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 120)
            .foregroundColor(book.color.darker(by: 70))
            .background(
                LinearGradient(gradient: Gradient(colors: [
                    book.color.opacity(0.6),
                    book.color.opacity(0.4),
                    book.color.opacity(0.2)
                ]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)

            book.image
                .resizable()
                .frame(width: 100, height: 140)
                .cornerRadius(18)
                .shadow(color: Color.gray.opacity(0.6), radius: 5)
                .offset(x: 20, y: -20)
        }
        .frame(maxWidth: .infinity)
    }

    func getStarType(for index: Int, rating: Double) -> String {
        let fullStars = Int(rating)
        if index < fullStars {
            return "star.fill"
        } else if index < fullStars + 1 && rating - Double(fullStars) > 0 {
            return "star.lefthalf.fill"
        } else {
            return "star"
        }
    }
}
