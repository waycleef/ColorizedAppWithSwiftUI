//
//  LabelAndSliderView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct LabelAndSliderView: View {
    
    @Binding var sliderValue: Double
    
    let color: Color
    
    var body: some View {
        HStack() {
            Text("\(lround(sliderValue))").frame(width: 40)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
        }
    }
}

//struct LabelAndSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelAndSliderView(sliderValue: <#Binding<Double>#>, color: .red)
//    }
//}
