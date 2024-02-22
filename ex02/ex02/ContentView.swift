//
//  ContentView.swift
//  ex02
//
//  Created by Chan on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var result: Int64 = 0
    @State private var current: Int64 = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack{
                        Spacer()
                        Text(String(result))
                            .font(.largeTitle)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Spacer()
                        Text(String(current))
                            .font(.largeTitle)
                            .multilineTextAlignment(.trailing)
                    }
                    Spacer()
                    buttonsView
                        .frame(height: geometry.size.height * 0.45)
                }
            }
            .navigationBarTitle("Calculator", displayMode: .inline)
        }
    }
    
    var buttonsView: some View {
        let buttons: [[(String, () -> Void)]] = [
            [("7", { self.buttonClickEvent("7") }), ("8", { self.buttonClickEvent("8") }), ("9", { self.buttonClickEvent("9") }), ("C", { self.buttonClickEvent("C") }), ("AC", { self.buttonClickEvent("AC") })],
            [("4", { self.buttonClickEvent("4") }), ("5", { self.buttonClickEvent("5") }), ("6", { self.buttonClickEvent("6") }), ("+", { self.buttonClickEvent("+") }), ("-", { self.buttonClickEvent("-") })],
            [("1", { self.buttonClickEvent("1") }), ("2", { self.buttonClickEvent("2") }), ("3", { self.buttonClickEvent("3") }), ("*", { self.buttonClickEvent("*") }), ("/", { self.buttonClickEvent("/") })],
            [("0", { self.buttonClickEvent("0") }), (".", { self.buttonClickEvent(".") }), ("00", { self.buttonClickEvent("00") }), ("=", { self.buttonClickEvent("=") }), ("",{self.buttonClickEvent("=")})]
        ]
        
        return GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(0..<buttons.count, id: \.self) { rowIndex in
                    HStack(spacing: 0) {
                        ForEach(0..<buttons[rowIndex].count, id: \.self) { columnIndex in
                            let button = buttons[rowIndex][columnIndex]
                            Button(action: button.1) {
                                Text(button.0)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .frame(width: self.calculateButtonWidth(containerWidth: geometry.size.width, buttonCount: buttons[rowIndex].count), height: calculateButtonHeight(containerHeight: geometry.size.height, buttonCount: buttons.count))
                                    .background(self.buttonColor(button.0))
                            }
                        }
                    }
                }
            }
            .frame(width: geometry.size.width)
        }
    }
    
    func calculateButtonWidth(containerWidth: CGFloat, buttonCount: Int) -> CGFloat {
        return (containerWidth) / CGFloat(buttonCount)
    }
    
    func calculateButtonHeight(containerHeight: CGFloat, buttonCount: Int) -> CGFloat {
        return (containerHeight) / CGFloat(buttonCount)
    }
    
    func buttonClickEvent(_ input: String) {
        print("Button pressed:", input)
    }
    
    func buttonColor(_ label: String) -> Color {
        switch label {
        case "AC", "C":
            return .red
        case "+", "-", "*", "/":
            return .orange
        case "=", "":
            return .green
        default:
            return .blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
    }
}
