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

                    Text(section.style)
                        .customFont(.caption2)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .foregroundColor(Color(red: 0.0, green: 0.3, blue: 0.0).opacity(0.5))
                  
                    Text(section.price)
                        .customFont(.caption)
                    
        
                }

                Spacer()
                
                VStack(spacing: 5) {
                    ForEach(0..<5) { index in
                        Image(systemName: getStarType(for: index, rating: section.star))
                            .foregroundColor(Color(red: 0.0, green: 0.3, blue: 0.0))
                            .opacity(0.6)
                            .font(.system(size: 12))
                            .rotationEffect(.degrees(70))
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 120)
            .foregroundColor(Color(red: 0.0, green: 0.3, blue: 0.0))
            .background(
                LinearGradient(gradient: Gradient(colors: [
                    Color.green.opacity(0.3),
                    Color.green.opacity(0.2),
                    Color.yellow.opacity(0.1)
                ]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)

            section.image
                .resizable()
                .frame(width: 100, height: 140)
                .cornerRadius(18)
                .shadow(color: Color.gray.opacity(0.9), radius: 5)
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

/*
 struct PopularCard: View {
 var popular: Home
 
 var body: some View {
 HStack(alignment: .top, spacing: 16) {
 
 popular.image
 .frame(width: 100, height: 150)
 .shadow(color: Color.gray.opacity(0.5), radius: 10)
 
 Spacer()
 
 VStack(alignment: .leading, spacing: 8) {
 Text(popular.title)
 .font(.title3)
 .fontWeight(.bold)
 .foregroundColor(.black)
 
 Text(popular.author)
 .font(.subheadline)
 .foregroundColor(.gray)
 
 Text(popular.style.uppercased())
 .font(.footnote)
 .foregroundColor(.gray)
 
 Spacer()
 
 HStack {
 Text(popular.price)
 .font(.title3)
 .fontWeight(.bold)
 .foregroundColor(.black)
 }
 }
 
 Spacer()
 
 VStack { // Center the stars within a VStack
 Spacer() // Push stars to the bottom of the VStack
 
 VStack (alignment: .leading, spacing: 5){
 ForEach(0..<5) { index in
 Image(systemName: getStarType(for: index, rating: popular.star))
 .foregroundColor(Color(red: 0.0, green: 0.3, blue: 0.0))
 .opacity(0.8)
 .font(.system(size: 13))
 }
 }
 .font(.caption)
 
 }
 }
 .padding()
 .background(Color.green.opacity(0.1))
 .cornerRadius(15)
 .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 8)
 .frame(width: 350, height: 150)
 }
 
 
 }
 
 struct PopularCard_Previews: PreviewProvider {
 static var previews: some View {
 PopularCard(popular: popular[1])
 }
 }
 
 */
