//
//  ContentView.swift
//  E-Library
//
//  Created by İrem Sever on 2.06.2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @State private var show = false
    @State private var isOpen = false
    var button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            SideMenu()
                .padding(.top, 0)
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -100)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                .ignoresSafeArea(.all, edges: .top)

            if isOpen {
                HomeView()
                    .homeViewModifiers(isOpen, show)
            } else {
                HomeView()
                    .homeViewModifiers(isOpen, show)
            }

            TabBar()
                .background(
                    LinearGradient(colors: [Color("Background").opacity(0), Color("Background")], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                )
                .ignoresSafeArea()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)

            button.view()
                .frame(width: 45, height: 45)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 2 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }

            Image(systemName: "person")
                .frame(width: 36, height: 36)
                .background(Color.white)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .padding()
                .offset(y: 4)
                .offset(x: isOpen ? 100 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }

            if show {
                LoginView()
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .offset(y: show ? -10 : 0)
                    .zIndex(1)
                    .transition(.move(edge: .top))
            }
        }
    }
}

extension View {
    func categoryViewModifiers(_ isOpen: Bool, _ show: Bool) -> some View {
        self
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 104) }
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 10 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
            .offset(x: isOpen ? 85 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .scaleEffect(show ? 0.92 : 1)
            .ignoresSafeArea()
    }

    func homeViewModifiers(_ isOpen: Bool, _ show: Bool) -> some View {
        self
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 104) }
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 10 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
            .offset(x: isOpen ? 85 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .scaleEffect(show ? 0.92 : 1)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
