//
//  ContentView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValueRed: Double = 0.0
    @State private var sliderValueGreen: Double = 0.0
    @State private var sliderValueBlue: Double = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            ColorizedView(red: sliderValueRed / 255, green: sliderValueGreen / 255, blue: sliderValueBlue / 255)
            VStack {
                LabelAndSliderView(sliderValue: $sliderValueRed, color: .red)
                LabelAndSliderView(sliderValue: $sliderValueGreen, color: .green)
                LabelAndSliderView(sliderValue: $sliderValueBlue, color: .blue)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
