//
//  LoginView.swift
//  E-Library
//
//  Created by İrem Sever on 3.06.2024.
//

import SwiftUI
import RiveRuntime

struct LoginView: View {
    let button = RiveViewModel(fileName: "button")
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x:200, y:100)
            )
    }
    
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading, spacing: 16) {
                Text("Explore Your E-Library")
                    .font(.custom("Poppins Bold", size: 60))
                    .frame(width: 260, alignment: .leading)
                
                Text("You can find books that you want read. You can find books that you want read. You can find books that you want read.")
                    .customFont(.body)
                    .opacity(0.7)
                    .frame(width: .infinity, alignment: .leading)
                
                Spacer()
                
                button.view()
                    .frame(width: 236, height: 64)
                    .overlay(
                        Label("Explore Books", systemImage: "arrow.forward")
                            .offset(x: 4, y: 4)
                            .font(.headline)
                    )
                    .background(
                        Color.black
                            .blur(radius: 10)
                            .opacity(0.3)
                            .offset(y: 10)
                    )
                    .onTapGesture {
                        button.play(animationName: "active")
                }
                
                Text("You can access more than a hundred book, summary, podcast, price and links")
                    .font(.footnote)
                    .opacity(0.7)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
