//
//  ContentView.swift
//  ex03
//
//  Created by Chan on 2/2/24.
//

import SwiftUI
import Expression

struct ContentView: View {
    @State private var expression: String = "0"
    @State private var result: String = "0"
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack{
                        Spacer()
                        Text(expression)
                            .font(.largeTitle)
                            .multilineTextAlignment(.trailing)
                            .padding(5)
                    }
                    HStack {
                        Spacer()
                        Text(result)
                            .font(.largeTitle)
                            .multilineTextAlignment(.trailing)
                            .padding(5)
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
            [("0", { self.buttonClickEvent("0") }), (".", { self.buttonClickEvent(".") }), ("00", { self.buttonClickEvent("00") }), ("=", { self.buttonCalculate() }), ("",{self.buttonCalculate()})]
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
        switch (input){
        case "AC":
            expression = "0"
            result = "0"
            break
        case "C":
            if expression != "0" {
                expression.removeLast()
                if expression.isEmpty { expression = "0" }
            }
            break
        case ".":
            expression += input
        default:
            if expression == "0" {
                expression = input
            } else {
                expression += input
            }
        }
    }
    
    func buttonCalculate() {
        do{
            let ex = Expression(expression)
            let res = try ex.evaluate()
            let integerPart = floor(res)
            let decimalPart = res.truncatingRemainder(dividingBy: 1)
            
            if res.isInfinite || res.isNaN {
                result = "Error"
            } else {
                if decimalPart == 0 {
                    result = String(format: "%.0f", integerPart)
                } else {
                    result = String(format: "%.17g", res)
                }
            }
        } catch {
            result = "Error"
        }
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
