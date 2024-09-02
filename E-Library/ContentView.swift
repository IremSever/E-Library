//
//  ContentView.swift
//  E-Library
//
//  Created by İrem Sever on 2.06.2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab: Tab = .home
    @State private var show = false
    @State private var isOpen = false
    var button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                
                SideMenu()
                    .padding(.top, 0)
                    .opacity(isOpen ? 1 : 0)
                    .offset(x: isOpen ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 0.5), value: isOpen)
                    .zIndex(3)
                    .ignoresSafeArea(.all, edges: .top)
                
                if isOpen {
                    CategoryView()
                        .categoryViewModifiers(isOpen, show)
                        .transition(.move(edge: .trailing))
                } else {
                    switch selectedTab {
                    case .home:
                        HomeView()
                            .homeViewModifiers(isOpen, show)
                    case .search:
                        SearchView()
                            .homeViewModifiers(isOpen, show)
                    case .star:
                        FavoriteView()
                            .homeViewModifiers(isOpen, show)
                    case .user:
                        AcountView()
                            .homeViewModifiers(isOpen, show)
                    }
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
                    .animation(.easeInOut(duration: 0.5), value: isOpen)
                    .zIndex(1)
                    
                button.view()
                    .frame(width: 45, height: 45)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
                    .onTapGesture {
                        button.setInput("isOpen", value: isOpen)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            isOpen.toggle()
                        }
                    }
                    .zIndex(3)
    
                Image("pp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }
                    .zIndex(1)
            }
        }
    }
}

extension View {
    func categoryViewModifiers(_ isOpen: Bool, _ show: Bool) -> some View {
        self
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 0) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 75) }
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 0 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
            .offset(x: isOpen ? 90 : 0)
            .scaleEffect(show ? 0.92 : 1)
            .ignoresSafeArea()
            .zIndex(2)
            .animation(.easeInOut(duration: 100), value: isOpen)
    }
    
    
    func homeViewModifiers(_ isOpen: Bool, _ show: Bool) -> some View {
        self
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) }
            .safeAreaInset(edge: .top) { Color.clear.frame(height: 130) }
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 0 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
            .offset(x: isOpen ? 65 : 0, y: isOpen ? 100 : 0)
            .scaleEffect(isOpen ? 0.79 : 1)
            .scaleEffect(show ? 0.92 : 1)
            .edgesIgnoringSafeArea(.bottom)
            .edgesIgnoringSafeArea(.top)
            .zIndex(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
