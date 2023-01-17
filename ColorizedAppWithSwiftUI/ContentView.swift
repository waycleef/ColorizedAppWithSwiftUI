//
//  ContentView.swift
//  ColorizedAppWithSwiftUI
//
//  Created by Алишер Маликов on 15.01.2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var red: Double = Double.random(in: 0...255).rounded()
    @State private var green: Double = Double.random(in: 0...255).rounded()
    @State private var blue: Double = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputActive: Field?
    
    var body: some View {
        ZStack{
            Color(.gray).opacity(0.2).ignoresSafeArea()
                .onTapGesture {
                    isInputActive = nil
                }
            
            VStack(spacing: 20) {
                ColorizedView(red: red, green: green, blue: blue)
                
                VStack {
                    LabelAndSliderView(value: $red, color: .red)
                        .focused($isInputActive, equals: .red)
                    LabelAndSliderView(value: $green, color: .green)
                        .focused($isInputActive, equals: .green)
                    LabelAndSliderView(value: $blue, color: .blue)
                        .focused($isInputActive, equals: .blue)
                }
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previous) {
                            Image(systemName: "chevron.up")
                        }
                        
                        Button(action: next) {
                            Image(systemName: "chevron.down")
                        }
                        
                        Spacer()
                        
                        Button("Done") {
                            isInputActive = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        
    }
    
}

extension ContentView {
    
    enum Field {
        case red, green, blue
    }
    private func next () {
        switch isInputActive {
        case .red:
            isInputActive = .green
        case .green:
            isInputActive = .blue
        case .blue:
            isInputActive = .red
        case .none:
            isInputActive = nil
        }
    }
    
    private func previous() {
        switch isInputActive {
        case .red:
            isInputActive = .blue
        case .green:
            isInputActive = .red
        case .blue:
            isInputActive = .green
        case .none:
            isInputActive = nil
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
