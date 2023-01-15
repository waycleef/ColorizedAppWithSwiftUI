//
//  TextFieldView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var text = ""
    
    var body: some View {
        TextField("Enter your name", text: $text)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
