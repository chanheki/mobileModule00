//
//  ContentView.swift
//  ex00
//
//  Created by Chan on 2024/02/01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Text("A Simple Text!")
                    .padding()
                Button("Click Me", role: .none) {
                    self.buttonClickEvent()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

func buttonClickEvent () {
    print("Button pressed")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
        ContentView()
            .previewLayout(.fixed(width: 400, height: 200))
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
