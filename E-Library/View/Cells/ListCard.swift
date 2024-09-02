//
//  ListCard.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI

struct ListCard: View {
  var section = sections[0]

  var body: some View {
    ZStack(alignment: .leading) {
      HStack(spacing: 15) {
        Spacer(minLength: 115)

        VStack(alignment: .leading, spacing: 4) {
          Text(section.title)
              .customFont(.title3)
              .lineLimit(3)
              .opacity(0.8)
              .truncationMode(.tail)
              .foregroundColor(Color(section.color.darker(by: 90)))

          Text(section.style)
              .customFont(.caption2)
              .lineLimit(2)
              .truncationMode(.tail)
              .foregroundColor(Color(section.color.darker(by: 80)))

          Text(section.price)
              .customFont(.caption)
              .foregroundColor(Color(section.color.darker(by: 80)))
        }

        Spacer()

        VStack(spacing: 5) {
          ForEach(0..<5) { index in
            Image(systemName: getStarType(for: index, rating: section.star))
                .foregroundColor(Color(section.color.darker(by: 70)))
                .opacity(0.6)
                .font(.system(size: 12))
                .rotationEffect(.degrees(70))
          }
        }
      }
      .padding(.horizontal)
      .frame(maxWidth: .infinity, maxHeight: 120)
      .foregroundColor(Color(section.color.darker(by: 70)))
      .background(
          LinearGradient(gradient: Gradient(colors: [
            section.color.opacity(0.6),
              section.color.opacity(0.4),
              section.color.opacity(0.2)
          ]), startPoint: .leading, endPoint: .trailing)
      )
      .cornerRadius(16)
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)

      section.image
          .resizable()
          .frame(width: 100, height: 140)
          .cornerRadius(18)
          .shadow(color: Color.gray.opacity(0.6), radius: 5)
          .offset(x: 20, y: -20)
    }
    .frame(maxWidth: .infinity)
  }

  func getStarType(for index: Int, rating: Float) -> String {
    let fullStars = Int(rating)
    if index < fullStars {
      return "star.fill"
    } else if index < fullStars + 1 && rating - Float(fullStars) > 0 {
      return "star.lefthalf.fill"
    } else {
      return "star"
    }
  }
}

struct ListCard_Previews: PreviewProvider {
  static var previews: some View {
    ListCard()
  }
}

