//
//  ContentView.swift
//  CustomModifier
//
//  Created by Justin Storrer on 11/1/22.
//

import SwiftUI

// Create a extension to create shortcut names for views
extension View {
    func watermark(text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding(90)
        .background(.mint)
        .watermark(text: "Hello")
    }
}

// Create a struct that conforms to ViewModifier
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .padding(10)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
