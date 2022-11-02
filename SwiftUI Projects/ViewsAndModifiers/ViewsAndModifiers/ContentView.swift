//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Justin Storrer on 10/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GridStack(rows: 4, columns: 4)  { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("Name")
            }
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}