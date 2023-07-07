//
//  ContentView.swift
//  iCalc
//
//  Created by HARDIK SHARMA on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var operation: String = ""
    @State private var result: String = ""
    
    let calculator = Calculator()
    
    var body: some View {
        VStack(spacing:20){
            CustomTextField(title: "First Number", text: $firstNumber)
            
            Picker("Picker", selection: $operation) {
                Text("+").tag("+")
                Text("-").tag("-")
                Text("*").tag("*")
                Text("/").tag("/")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            CustomTextField(title: "Second Number", text: $secondNumber)
            
            Text(result)
                .font(.title)
                .foregroundColor(.mint)
            
            Button {
                self.result = calculator.calculate(firstNumber: firstNumber, secondNumber: secondNumber, operation: operation)
            } label: {
                Text("Calculate")
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        }
    }
}

class Calculator{

    func calculate(firstNumber: String, secondNumber: String, operation: String) -> String{
        var a: Double = Double(firstNumber) ?? 0
        var b: Double = Double(secondNumber) ?? 0
        switch operation{
        case "+":
            return String(a+b)
        case "-":
            return String(a-b)
        case "*":
            return String(a*b)
        case "/":
            return String(a/b)
        default:
            return("Invalid Operation")
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
