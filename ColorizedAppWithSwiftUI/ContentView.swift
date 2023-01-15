//
//  ContentView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sliderValueRed: Double = Double.random(in: 0...255)
    @State private var sliderValueGreen: Double = Double.random(in: 0...255)
    @State private var sliderValueBlue: Double = Double.random(in: 0...255)
        
    @State private var showAlert = false
    @FocusState private var isInputActive: Field?
    
    var hasReachedEnd: Bool {
        isInputActive == Field.allCases.last
    }
    
    var hasReachedStart: Bool {
        isInputActive == Field.allCases.first
    }
    
    enum Field: Int, Hashable, CaseIterable {
        case red, green, blue
    }
    
    var body: some View {
        ZStack{
            Color(.gray).opacity(0.2).ignoresSafeArea()
            VStack(spacing: 20) {
                ColorizedView(red: sliderValueRed / 255, green: sliderValueGreen / 255, blue: sliderValueBlue / 255)
                
                HStack{
                    VStack {
                        LabelAndSliderView(sliderValue: $sliderValueRed, color: .red)
                        LabelAndSliderView(sliderValue: $sliderValueGreen, color: .green)
                        LabelAndSliderView(sliderValue: $sliderValueBlue, color: .blue)
                    }
                    
                    VStack {
                        TextFieldView(text: $sliderValueRed)
                            .focused($isInputActive, equals: .red)
                        TextFieldView(text: $sliderValueGreen)
                            .focused($isInputActive, equals: .green)
                        TextFieldView(text: $sliderValueBlue)
                            .focused($isInputActive, equals: .blue)
                    }
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard) {
                            Button(action: previous) {
                                Image(systemName: "chevron.up")
                            }
                            .disabled(hasReachedStart)
                            
                            Button(action: next) {
                                Image(systemName: "chevron.down")
                            }
                            .disabled(hasReachedEnd)
                            
                            Spacer()
                            
                            Button("Done", action: checkValue)
                                .alert("Worning", isPresented: $showAlert, actions: {}) {
                                    Text("Please enter value from 0 to 255")
                                }
                        }
                    }
                }
                
                Spacer()
            }
            
            .padding()
        }
        
    }
    
    private func checkValue() {
        if sliderValueRed > 255 || sliderValueRed < 0 {
            showAlert = true
            sliderValueRed = 0

        }
        if sliderValueGreen > 255 || sliderValueGreen < 0 {
            showAlert = true
            sliderValueGreen = 0.0

        }
        if sliderValueBlue > 255 || sliderValueBlue < 0 {
            showAlert = true
            sliderValueBlue = 0

        }
    }
    
    private func next () {
        guard let currentInput = isInputActive,
              let lastIndex = Field.allCases.last?.rawValue else { return }
        
        let index = min(currentInput.rawValue + 1, lastIndex)
        self.isInputActive = Field(rawValue: index)
        
    }
    
    private func previous() {
        guard let currentInput = isInputActive,
              let firstIndex = Field.allCases.first?.rawValue else { return }
        
        let index = min(currentInput.rawValue - 1, firstIndex)
        self.isInputActive = Field(rawValue: index)
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
