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
    @State var showModel = false
    //@Binding var show: Bool
    
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
            
            Color("Shadow").ignoresSafeArea()
                .opacity(showModel ? 0.4 : 0)
            
            content
                .offset(y: showModel ? -50 : 0)
            
            if showModel {
                SignInView(show: $showModel)
                    .opacity(showModel ? 1 : 0)
                    .offset(y: showModel ? 0 : 300)
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModel.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .offset(y: showModel ? 0 : 200)
                    )
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .zIndex(1)
            }
            
        }
    }
    
    
    var content: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Explore Your E-Library")
                .font(.custom("Poppins Bold", size: 60 ))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Immerse yourself in a vast library of over 1000 books across diverse genres and topics. Discover captivating stories, expand your knowledge, and fuel your intellectual curiosity.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            button.view()
                .frame(width: 230, height: 64)
            
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModel.toggle()
                        }
                    }
                }
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
}

#Preview {
    LoginView()
}
