//
//  CategoryView.swift
//  E-Library
//
//  Created by İrem Sever on 16.07.2024.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(spacing: 40) {
            Text("Categories")
                .customFont(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 40) {
                ForEach(sections) { section in
                    ListCard(section: section)
                }
            }
        }
        .padding(0)
    }
    
}
#Preview {
    CategoryView()
}
