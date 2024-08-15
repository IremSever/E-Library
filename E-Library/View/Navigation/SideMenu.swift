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
        HStack {
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 50) {
                    Spacer()

                    ForEach(categoryItem.indices, id: \.self) { index in
                        Text(categoryItem[index].text)
                            .font(.system(size: 18, weight: .regular))
                            .rotationEffect(.degrees(270), anchor: .leading)
                            .padding(.vertical, 20)
                            .bold()
                            .opacity(selectedCategory == categoryItem[index].menu ? 1 : 0.5)
                            .onTapGesture {
                                withAnimation {
                                    selectedCategory = categoryItem[index].menu
                                }
                            }
                    }
                }
                .frame(width: 150)
            }
            .foregroundColor(.white)
            .frame(maxWidth: 150, maxHeight: .infinity)
            .background(
                WaveShape()
                    .fill(Color(.black))
                    .frame(width: 150)
            )
            .ignoresSafeArea()

            Spacer()
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
