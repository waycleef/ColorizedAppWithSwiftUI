//
//  LabelAndSliderView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct LabelAndSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        HStack() {
            Text(value.formatted())
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
            
            TextFieldView(text: $text, value: $value, action: checkValue)
                .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
}

extension LabelAndSliderView {
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct LabelAndSliderView_Previews: PreviewProvider {
    static var previews: some View {
        LabelAndSliderView(value: .constant(20), color: .red)
    }
}
