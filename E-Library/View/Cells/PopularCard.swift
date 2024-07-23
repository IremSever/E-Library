//
//  PopularCard.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//


import SwiftUI

struct PopularCard: View {
    var popular: Home
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            
            popular.image
                .resizable()
                .frame(width: 130, height: 200)
                .shadow(color: Color.gray.opacity(0.5), radius: 10)
            
            VStack(alignment: .leading, spacing: 6) {
                Spacer()
    
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: getStarType(for: index, rating: popular.star))
                            .foregroundColor(.yellow)
                    }
                }
                .font(.caption)
                
                Text(popular.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(popular.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(popular.style)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Button(action: {}) {
                            Text(popular.price)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 5)
                        }
                        .background(.white)
                        .cornerRadius(20)
                        
                        Text("Buy Now")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(Color.black)
                    .cornerRadius(40)
                }
                Spacer()
            }
            .padding(.bottom, 5)
            
        }
        
        .padding()
                .background(.clear)
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 8)
                .frame(width: 350, height: 200)
        
        
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

struct PopularCard_Previews: PreviewProvider {
    static var previews: some View {
        PopularCard(popular: popular[1])
    }
}
