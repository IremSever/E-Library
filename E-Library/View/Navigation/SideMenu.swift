//
//  SideMenu.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State var isDarkMode = false
    @AppStorage("selectedCategory") var selectedCategory: SelectedCategory = .science
    
    var body: some View {
        VStack() {
            Spacer()
            browse
           
        }
        .foregroundColor(.white)
        .frame(maxWidth: 80, maxHeight: .infinity)
        .background(
            WavyShape()
                .fill(Color("Background 2"))
                .frame(width: 100)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .ignoresSafeArea()
    }
    
    var browse: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(menuItems) { item in
                Text(item.text)
                    .font(.system(size: 18, weight: .regular))
                    .rotationEffect(.degrees(270))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 45)
                    .opacity(selectedCategory == item.menu ? 1 : 0.5)
                    .onTapGesture {
                        withAnimation {
                            selectedCategory = item.menu
                        }
                    }
            }
        }
    }
    
    func tabButton(for tab: SelectedCategory, riveViewModel: RiveViewModel) -> some View {
        Button {
            riveViewModel.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                riveViewModel.setInput("active", value: false)
            }
            withAnimation {
                selectedCategory = tab
            }
        } label: {
            riveViewModel.view()
                .frame(width: 35, height: 35)
                .frame(maxWidth: .infinity)
                .opacity(selectedCategory == tab ? 1 : 0.5)
        }
    }
}

struct WavyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waveHeight: CGFloat = 20
        let waveLength: CGFloat = 60
        
        path.move(to: CGPoint(x: rect.width, y: 0))
        
        var y: CGFloat = 0
        
        while y < rect.height {
            path.addQuadCurve(to: CGPoint(x: rect.width - waveHeight, y: y + waveLength / 2),
                              control: CGPoint(x: rect.width, y: y + waveLength / 4))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: y + waveLength),
                              control: CGPoint(x: rect.width, y: y + waveLength * 3 / 4))
            y += waveLength
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        return path
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var menu: SelectedCategory
}

var menuItems = [
    MenuItem(text: "Science", menu: .science),
    MenuItem(text: "Magazine", menu: .magazine),
    MenuItem(text: "Story", menu: .story),
    MenuItem(text: "General", menu: .general),
    MenuItem(text: "History", menu: .history),
    MenuItem(text: "Lifestyle", menu: .lifestyle)
]

enum SelectedCategory: String {
    case science
    case magazine
    case story
    case general
    case history
    case lifestyle
}

