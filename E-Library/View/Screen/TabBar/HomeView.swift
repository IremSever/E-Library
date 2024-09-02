//
//  HomeView.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Best Books")
                    .customFont(.subheadline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(popular) { popular in
                        PopularCard(popular: popular)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            
            VStack(spacing: 40) {
                Text("All Books")
                    .customFont(.subheadline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 40) {
                    ForEach(sections) { section in
                        ListCard(section: section)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
