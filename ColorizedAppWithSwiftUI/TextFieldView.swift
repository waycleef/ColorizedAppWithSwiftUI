//
//  TextFieldView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: Double
    
    var body: some View {
        TextField("255", value: $text, formatter: NumberFormatter())
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .submitLabel(.done)
            .keyboardType(.decimalPad)
        }
}
    

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(255))
    }
}
