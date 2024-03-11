# Calculator App

This app use the math_operation library.

Apply AutoLayout via Geometry Reader

</br>

## What I learned

- [SwiftUI](https://developer.apple.com/documentation/swiftui/)
- [Text](https://developer.apple.com/documentation/swiftui/text)
- [Button](https://developer.apple.com/documentation/swiftui/button)
- [Render(diff)](https://developer.apple.com/documentation/swiftui/drawing-and-graphics)
- [State / Binding](https://developer.apple.com/documentation/swiftui/stat)
- [Expression Library](https://github.com/nicklockwood/Expression)
- [SwiftUI AutoLayout](https://developer.apple.com/documentation/swiftui/GeometryReader)
- Peer Soft Skill

|||
|---|---|
|<img width="283" alt="image" src="https://github.com/chanheki/mobileModule00/assets/85754295/3889bc00-3241-4ac3-bb6a-a27023b1cb0a">|<img width="481" alt="image" src="https://github.com/chanheki/mobileModule00/assets/85754295/24915f1b-f92f-4116-973d-8899aece5f24">|

</br>

## A quick look at SWIFT code

``` Swift
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
```
