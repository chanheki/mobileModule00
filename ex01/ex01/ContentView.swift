//
//  ContentView.swift
//  ex01
//
//  Created by Chan on 2024/02/01.
//

import SwiftUI

struct ContentView: View {
    @State private var centerText = "A Simple Text!"
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Text(centerText)
                    .padding()
                Button("Click Me", role: .none) {
                    self.buttonClickEvent()
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    func buttonClickEvent() {
        if centerText == "A Simple Text!" {
            centerText = "Hello, World"
        } else {
            centerText = "A Simple Text!"
        }
        print("Button pressed")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (11-inch) (4th generation)")
        ContentView()
            .previewLayout(.device)
    }
}
