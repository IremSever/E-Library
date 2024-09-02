//
//  TabBar.swift
//  E-Library
//
//  Created by İrem Sever on 15.07.2024.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State private var isCameraPresent = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                tabButton(for: .home, imageName: "home")
                tabButton(for: .search, imageName: "search")
                Spacer()
                    .frame(width: 88, height: 0)
                tabButton(for: .star, imageName: "star")
                tabButton(for: .user, imageName: "profile")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background(
                TabBarBackground()
                    .fill(Color(.black))
                    .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: -10)
            )
            .overlay(middleButton, alignment: .top)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var middleButton: some View {
        Button(action: {
            isCameraPresent = true
        }) {
            Image(systemName: "qrcode.viewfinder")
                .font(.system(size: 25))
                .frame(width: 70, height: 70)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        }
        .offset(y: -50)
        .fullScreenCover(isPresented: $isCameraPresent) {
            ImagePicker(sourceType: .camera)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    func tabButton(for tab: Tab, imageName: String) -> some View {
        Button {
            withAnimation {
                selectedTab = tab
            }
        } label: {
            Image(imageName)
                .resizable()
                .renderingMode(.template) //change color
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .opacity(selectedTab == tab ? 1 : 0.5)
        }
    }

}

struct TabBarBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let curveHeight: CGFloat = 50
        let curveWidth: CGFloat = 125
        let midX = rect.midX
        let cornerRadius: CGFloat = 0
        let curveEdgeRadius: CGFloat = 20

        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                   radius: cornerRadius,
                   startAngle: .radians(.pi),
                   endAngle: .radians(3 * .pi / 2),
                   clockwise: false)

        let leftCurveStart = CGPoint(x: midX - curveWidth / 2 - curveEdgeRadius, y: rect.minY - 15)
        path.addLine(to: leftCurveStart)
        path.addArc(center: CGPoint(x: midX - curveWidth / 2, y: rect.minY + curveEdgeRadius - 18),
                   radius: curveEdgeRadius,
                   startAngle: .radians(3 * .pi / 2),
                   endAngle: .radians(2 * .pi),
                   clockwise: false)

        let controlPoint1 = CGPoint(x: midX - curveWidth / 4, y: rect.minY + curveHeight * 0.8)
        let controlPoint2 = CGPoint(x: midX + curveWidth / 4, y: rect.minY + curveHeight * 0.8)
        let rightCurveEnd = CGPoint(x: midX + curveWidth / 2 - curveEdgeRadius, y: rect.minY)
        path.addCurve(to: rightCurveEnd, control1: controlPoint1, control2: controlPoint2)

        path.addArc(center: CGPoint(x: midX + curveWidth / 2, y: rect.minY + curveEdgeRadius - 18),
                   radius: curveEdgeRadius,
                   startAngle: .radians(2 * .pi),
                   endAngle: .radians(3 * .pi / 2),
                   clockwise: false)

        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                   radius: cornerRadius,
                   startAngle: .radians(3 * .pi / 2),
                   endAngle: .radians(0),
                   clockwise: false)

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

enum Tab: String {
    case home
    case search
    case star
    case user
}

