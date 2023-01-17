//
//  ColorizedView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct ColorizedView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .frame(width: 343, height: 128)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(lineWidth: 4))
    }
}

struct ColorizedView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedView(red: 255, green: 22, blue: 100)
    }
}
