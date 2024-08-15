//
//  TabBar.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State private var isCameraPresent = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                tabButton(for: .home, riveViewModel: tabItems[0].icon)
                tabButton(for: .search, riveViewModel: tabItems[1].icon)
                Spacer()
                    .frame(width: 88, height: 0)
                tabButton(for: .star, riveViewModel: tabItems[2].icon)
                tabButton(for: .user, riveViewModel: tabItems[3].icon)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background(
                TabBarBackground()
                    .fill(Color(.black))
                    .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: -10)
            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 0, style: .continuous)
//                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .top, endPoint: .bottom))
//            )
            .overlay(middleButton, alignment: .top)
        }
        .edgesIgnoringSafeArea(.bottom) 
    }
    
    var middleButton: some View {
        Button(action: {
            isCameraPresent = true
            
        }) {
            Image(systemName: "qrcode.viewfinder")
                .font(.system(size: 75))
                .frame(width: 65, height: 65)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        }
        .offset(y: -30)
        .fullScreenCover(isPresented: $isCameraPresent) {
            ImagePicker(sourceType: .camera)
                    .edgesIgnoringSafeArea(.all)
                }
    }
    
    func tabButton(for tab: Tab, riveViewModel: RiveViewModel) -> some View {
        Button {
            riveViewModel.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                riveViewModel.setInput("active", value: false)
            }
            withAnimation {
                selectedTab = tab
            }
        } label: {
            riveViewModel.view()
                .frame(width: 35, height: 35)
                .frame(maxWidth: .infinity)
                .opacity(selectedTab == tab ? 1 : 0.5)
        }
    }
}

//struct TabBarBackground: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        // dimensions
//        let curveHeight: CGFloat = -90
//        let curveWidth: CGFloat = 90
//        let midX = rect.midX
//        let cornerRadius: CGFloat = 50 // Adjust corner radius to 0 for sharp corners
//        
//        // top left corner
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        
//        // top curve
//        path.addLine(to: CGPoint(x: midX - curveWidth / 2, y: rect.minY))
//        path.addQuadCurve(to: CGPoint(x: midX + curveWidth / 2, y: rect.minY), control: CGPoint(x: midX, y: rect.minY - curveHeight))
//        
//        // top right corner
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        
//        // bottom right corner
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//     
//        // bottom left corner
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        
//        return path
//    }
//}

struct TabBarBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // dimensions
        let curveHeight: CGFloat = -90
        let curveWidth: CGFloat = 90
        let midX = rect.midX
        let cornerRadius: CGFloat = 50

        // top left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle:
 .radians(.pi), endAngle: .radians(3 * .pi / 2), clockwise: false)

        // top curve
        path.addLine(to: CGPoint(x: midX - curveWidth / 2, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: midX + curveWidth / 2, y: rect.minY), control: CGPoint(x: midX, y: rect.minY - curveHeight))

        // top right corner
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle:
 .radians(3 * .pi / 2), endAngle: .radians(0), clockwise: false)
        
        // bottom right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        // bottom left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

//struct TabBarBackground: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        // dimensions
//        let curveHeight: CGFloat = -90
//        let curveWidth: CGFloat = 90
//        let midX = rect.midX
//        let cornerRadius: CGFloat = 10 // adjust corner radius
//        
//        // top left corner
//        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
//        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: .radians(-.pi / 2), endAngle: .radians(0), clockwise: false)
//        
//        // top curve
//        path.addLine(to: CGPoint(x: midX - curveWidth / 2, y: rect.minY))
//        path.addQuadCurve(to: CGPoint(x: midX + curveWidth / 2, y: rect.minY), control: CGPoint(x: midX, y: rect.minY - curveHeight))
//        
//        // top right corner
//        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: .radians(0), endAngle: .radians(.pi / 2), clockwise: false)
//        
//        // bottom right corner
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
//     
//        // bottom left corner
//        path.addLine(to: CGPoint(x: rect.minX - cornerRadius, y: rect.maxY))
//        
//        return path
//    }
//}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), tab: .home),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), tab: .star),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
]

enum Tab: String {
    case home
    case search
    case star
    case user
}
