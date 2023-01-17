//
//  TextFieldView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    @Binding var value: Double
    
    var action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .frame(width: 50)
        .submitLabel(.done)
        .keyboardType(.decimalPad)
    }
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant("255"), value: .constant(128.0), action: {})
    }
}
