//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Justin Storrer on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var people = 2
    @State private var tipPercentage = 20
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPlusTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = tipValue + checkAmount
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(people + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = tipValue + checkAmount
        let total = grandTotal / peopleCount
        
        return total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $people) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount Per Person")
                }
                
                Section {
                    Text(totalPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .primary)
                } header: {
                    Text("Total amount plus tip")
                }
            }
            .navigationTitle("Check-Splitting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        amountIsFocused = false
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
